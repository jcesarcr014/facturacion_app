import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:facturacion_app/core/network/secure_storage_service.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart' as sunmi_printer;
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
part 'printer_service.g.dart';

class PrinterService {
  final SecureStorageService _secureStorage;

  PrinterService(this._secureStorage);

  Future<void> printTicket(BuildContext context, String ticketContent) async {
    // 1. Always output ticket to terminal console for debugging/logs
    print(ticketContent);

    final isEnabled = await _secureStorage.readPrinterEnabled();
    final printerType = await _secureStorage.readPrinterType();

    if (printerType == 'none' || !isEnabled) {
      // Show float toast that ticket was printed to console
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.print_disabled_outlined, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text('Impresión física desactivada. Ticket en consola.'),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF334155),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    if (printerType == 'bluetooth' && Platform.isAndroid) {
      final bluetooth = BlueThermalPrinter.instance;

      // Check if Bluetooth adapter is enabled
      final bool? isAvailable = await bluetooth.isAvailable;
      if (isAvailable != true) {
        _showBluetoothOffDialog(context);
        return;
      }

      // Check connection status
      final bool? isConnected = await bluetooth.isConnected;
      if (isConnected == true) {
        // Already connected: print immediately!
        await _runPrintSequence(context, bluetooth, ticketContent);
        return;
      }

      // Not connected: check saved device configuration
      final savedAddress = await _secureStorage.readPrinterAddress();
      if (savedAddress != null && savedAddress.isNotEmpty) {
        final List<BluetoothDevice> devices = await bluetooth
            .getBondedDevices();
        BluetoothDevice? targetDevice;
        for (final d in devices) {
          if (d.address == savedAddress) {
            targetDevice = d;
            break;
          }
        }

        if (targetDevice != null) {
          // Attempt automatic connection
          final success = await _connectToPrinterWithProgress(
            context,
            bluetooth,
            targetDevice,
          );
          if (success) {
            await _runPrintSequence(context, bluetooth, ticketContent);
            return;
          }
        }
      }

      // If no saved device or connection failed, prompt user to select a printer
      if (context.mounted) {
        await _promptDeviceSelectionAndPrint(context, bluetooth, ticketContent);
      }
    } else if (printerType == 'integrated' && Platform.isAndroid) {
      if (context.mounted) {
        _showPrintingProgressDialog(
          context,
          message: 'Imprimiendo en impresora interna...',
        );
      }
      try {
        final isBound = await sunmi_printer.SunmiPrinter.bindingPrinter();
        if (isBound == true) {
          await sunmi_printer.SunmiPrinter.initPrinter();
          final lines = ticketContent.split('\n');
          final textBuffer = StringBuffer();
          for (final line in lines) {
            if (_isQrLine(line)) {
              final qrData = _extractQrData(line);
              if (textBuffer.isNotEmpty) {
                await sunmi_printer.SunmiPrinter.printText(textBuffer.toString());
                textBuffer.clear();
              }
              if (qrData.isNotEmpty) {
                await sunmi_printer.SunmiPrinter.lineWrap(1);
                await sunmi_printer.SunmiPrinter.printQRCode(
                  qrData,
                  style: sunmi_printer.SunmiQrcodeStyle(
                    qrcodeSize: 5,
                    align: sunmi_printer.SunmiPrintAlign.CENTER,
                  ),
                );
                await sunmi_printer.SunmiPrinter.lineWrap(1);
              }
            } else {
              textBuffer.writeln(line);
            }
          }
          if (textBuffer.isNotEmpty) {
            await sunmi_printer.SunmiPrinter.printText(textBuffer.toString());
          }
          await sunmi_printer.SunmiPrinter.lineWrap(3);
        } else {
          print('Impresora interna (Sunmi) no vinculada');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'La impresora interna no está disponible o no es compatible.',
                ),
              ),
            );
          }
        }
      } catch (e) {
        print('Error impresora interna: $e');
      }
    } else if (printerType == 'usb' && Platform.isAndroid) {
      final usbInfo = await _secureStorage.readUsbPrinter();
      final width = await _secureStorage.readPrinterWidth();
      if (usbInfo != null) {
        await _runUsbPrintSequence(context, usbInfo, ticketContent, width);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No hay impresora USB seleccionada en ajustes.'),
            ),
          );
        }
      }
    } else if (printerType == 'windows_system' && Platform.isWindows) {
      // TODO: Implement Windows desktop printing here
      await _showSimulatedDialogAndDelay(
        context,
        "Enviando a Windows Spooler...",
      );
    } else {
      // Fallback
      await _showSimulatedDialogAndDelay(context, "Simulando Impresión...");
    }
  }

  // --- PRIVATE UTILITIES ---

  bool _isQrLine(String line) {
    final trimmed = line.trim();
    if (trimmed.startsWith('<<<QR:') && trimmed.endsWith('>>>')) return true;
    if (trimmed.startsWith('https://verificacfdi.') ||
        trimmed.startsWith('https://consulta.cfdi.')) {
      return true;
    }
    return false;
  }

  String _extractQrData(String line) {
    final trimmed = line.trim();
    if (trimmed.startsWith('<<<QR:') && trimmed.endsWith('>>>')) {
      return trimmed.substring(6, trimmed.length - 3).trim();
    }
    return trimmed;
  }

  Future<void> _runPrintSequence(
    BuildContext context,
    BlueThermalPrinter bluetooth,
    String ticketContent,
  ) async {
    _showPrintingProgressDialog(context);

    // Read configured font size
    final fontSize = await _secureStorage.readPrinterFontSize();

    // Send formatted lines to the thermal printer
    try {
      final lines = ticketContent.split('\n');
      for (final line in lines) {
        if (_isQrLine(line)) {
          final qrData = _extractQrData(line);
          if (qrData.isNotEmpty) {
            try {
              await bluetooth.printNewLine();
              await bluetooth.printQRcode(qrData, 240, 240, 1);
              await bluetooth.printNewLine();
            } catch (e) {
              print("Error printing QR code: $e");
              await bluetooth.printCustom(qrData, 0, 1);
            }
          }
        } else {
          // printCustom(String text, int size, int align)
          // size: 0 (small), 1 (medium), 2 (large)
          // align: 0 (left-aligned)
          await bluetooth.printCustom(line, fontSize, 0);
        }
      }
      // Feed paper so it can be torn off cleanly
      await bluetooth.printNewLine();
      await bluetooth.printNewLine();
      await bluetooth.printNewLine();
    } catch (e) {
      print("Error during physical print: $e");
    }

    // Delay 3 seconds to keep dialog aligned with paper output
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> _runUsbPrintSequence(
    BuildContext context,
    Map<String, String> usbInfo,
    String ticketContent,
    int width,
  ) async {
    _showPrintingProgressDialog(
      context,
      message: 'Conectando a impresora USB...',
    );

    try {
      final profile = await CapabilityProfile.load();
      final paperSize = width == 48 ? PaperSize.mm80 : PaperSize.mm58;
      final generator = Generator(paperSize, profile);
      List<int> bytes = [];

      final lines = ticketContent.split('\n');
      for (final line in lines) {
        if (_isQrLine(line)) {
          final qrData = _extractQrData(line);
          if (qrData.isNotEmpty) {
            bytes += generator.feed(1);
            bytes += generator.qrcode(
              qrData,
              align: PosAlign.center,
              size: QRSize.size4,
            );
            bytes += generator.feed(1);
          }
        } else {
          bytes += generator.text(
            line,
            styles: const PosStyles(codeTable: 'CP1252'),
          );
        }
      }
      bytes += generator.feed(3);
      bytes += generator.cut();

      final printerManager = PrinterManager.instance;

      bool isConnected = await printerManager.connect(
        type: PrinterType.usb,
        model: UsbPrinterInput(
          name: 'USB Printer',
          productId: usbInfo['productId'],
          vendorId: usbInfo['vendorId'],
        ),
      );

      if (isConnected) {
        printerManager.send(type: PrinterType.usb, bytes: bytes);
        await Future.delayed(const Duration(seconds: 2));
        printerManager.disconnect(type: PrinterType.usb);
      } else {
        print("Error: No se pudo conectar a la impresora USB");
      }
    } catch (e) {
      print("Error during USB print: $e");
    }
  }

  Future<bool> _connectToPrinterWithProgress(
    BuildContext context,
    BlueThermalPrinter bluetooth,
    BluetoothDevice device,
  ) async {
    // Show connection loading overlay
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: [
              const CircularProgressIndicator(color: Color(0xFF0D9488)),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  'Conectando a:\n${device.name ?? "Impresora"}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    try {
      await bluetooth.connect(device);
      if (context.mounted) Navigator.pop(context); // Dismiss loading
      return true;
    } catch (e) {
      if (context.mounted) Navigator.pop(context); // Dismiss loading
      _showConnectionErrorSnackBar(context, device.name ?? "Impresora");
      return false;
    }
  }

  Future<void> _promptDeviceSelectionAndPrint(
    BuildContext context,
    BlueThermalPrinter bluetooth,
    String ticketContent,
  ) async {
    final List<BluetoothDevice> devices = await bluetooth.getBondedDevices();

    if (devices.isEmpty) {
      _showNoDevicesDialog(context);
      return;
    }

    if (!context.mounted) return;

    // Show list of bonded devices for user configuration
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          title: const Row(
            children: [
              Icon(Icons.bluetooth, color: Color(0xFF0D9488)),
              SizedBox(width: 12),
              Text(
                'Seleccionar Impresora',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return ListTile(
                  leading: const Icon(
                    Icons.print_outlined,
                    color: Color(0xFF94A3B8),
                  ),
                  title: Text(
                    device.name ?? 'Dispositivo Desconocido',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    device.address ?? '',
                    style: const TextStyle(color: Color(0xFF94A3B8)),
                  ),
                  onTap: () async {
                    Navigator.pop(dialogContext); // Close dialog

                    // Attempt connection and print
                    final success = await _connectToPrinterWithProgress(
                      context,
                      bluetooth,
                      device,
                    );
                    if (success) {
                      // Save device address
                      await _secureStorage.writePrinterAddress(
                        device.address ?? '',
                      );
                      await _runPrintSequence(
                        context,
                        bluetooth,
                        ticketContent,
                      );
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showPrintingProgressDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });

        return Dialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.print_outlined,
                  color: Color(0xFFD97706),
                  size: 64,
                ),
                const SizedBox(height: 20),
                const Text(
                  '🖨️ Imprimiendo Ticket...',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message ??
                      'Generando copia física del ticket de facturación...',
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                const LinearProgressIndicator(color: Color(0xFFD97706)),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSimulatedDialogAndDelay(
    BuildContext context,
    String message,
  ) async {
    _showPrintingProgressDialog(context, message: message);
    // Delay 3 seconds to keep dialog aligned with paper output
    await Future.delayed(const Duration(seconds: 3));
  }

  void _showBluetoothOffDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'Bluetooth Desactivado',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Por favor enciende el Bluetooth de tu dispositivo para poder conectarte a la impresora térmica.',
          style: TextStyle(color: Color(0xFF94A3B8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar',
              style: TextStyle(color: Color(0xFF0D9488)),
            ),
          ),
        ],
      ),
    );
  }

  void _showNoDevicesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'Sin Dispositivos Vinculados',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'No se encontraron impresoras Bluetooth vinculadas en Android.\n\nVe a Ajustes de Bluetooth del dispositivo, vincula tu impresora de 58mm e inténtalo de nuevo.',
          style: TextStyle(color: Color(0xFF94A3B8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar',
              style: TextStyle(color: Color(0xFF0D9488)),
            ),
          ),
        ],
      ),
    );
  }

  void _showConnectionErrorSnackBar(BuildContext context, String printerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text('No se pudo establecer conexión con: $printerName'),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

@riverpod
PrinterService printerService(PrinterServiceRef ref) {
  return PrinterService(ref.watch(secureStorageServiceProvider));
}

@riverpod
class PrinterEnabled extends _$PrinterEnabled {
  late SecureStorageService _secureStorage;

  @override
  Future<bool> build() async {
    _secureStorage = ref.watch(secureStorageServiceProvider);
    return await _secureStorage.readPrinterEnabled();
  }

  Future<void> toggle() async {
    final current = state.value ?? false;
    await _secureStorage.writePrinterEnabled(!current);
    state = AsyncValue.data(!current);
  }
}
