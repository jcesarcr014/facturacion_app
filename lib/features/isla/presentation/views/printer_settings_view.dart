import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:facturacion_app/core/network/secure_storage_service.dart';
import 'package:flutter_pos_printer_platform_image_3/flutter_pos_printer_platform_image_3.dart';
import 'package:facturacion_app/core/services/printer_service.dart';

class PrinterSettingsView extends ConsumerStatefulWidget {
  const PrinterSettingsView({super.key});

  @override
  ConsumerState<PrinterSettingsView> createState() =>
      _PrinterSettingsViewState();
}

class _PrinterSettingsViewState extends ConsumerState<PrinterSettingsView> {
  late SecureStorageService _secureStorage;
  String _printerType =
      'none'; // 'none', 'integrated', 'bluetooth', 'windows_system'
  String? _printerAddress;
  int _printerWidth = 32;
  int _printerFontSize = 0;
  String _integratedModel = 'sunmi';

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _selectedDevice;

  List<PrinterDevice> _usbDevices = [];
  PrinterDevice? _selectedUsbDevice;
  bool _isScanningUsb = false;
  Map<String, String>? _savedUsbInfo;

  bool _isTesting = false;
  bool _isScanningBluetooth = false;
  bool _isConnecting = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _secureStorage = ref.read(secureStorageServiceProvider);
    _loadSavedSettings();
    if (Platform.isAndroid) {
      BlueThermalPrinter.instance.onStateChanged().listen((state) {
        if (mounted) {
          setState(() {
            _isConnected = state == BlueThermalPrinter.CONNECTED;
          });
        }
      });
    }
  }

  Future<void> _loadSavedSettings() async {
    final type = await _secureStorage.readPrinterType();
    final address = await _secureStorage.readPrinterAddress();
    final width = await _secureStorage.readPrinterWidth();
    final fontSize = await _secureStorage.readPrinterFontSize();
    final integrated = await _secureStorage.readIntegratedModel();
    final usbInfo = await _secureStorage.readUsbPrinter();

    setState(() {
      _printerType = type;
      _printerAddress = address;
      _printerWidth = width;
      _printerFontSize = fontSize;
      _integratedModel = integrated;
      _savedUsbInfo = usbInfo;
    });

    if (Platform.isAndroid) {
      if (type == 'bluetooth') {
        _scanBluetoothDevices();
      }
    }
  }

  Future<void> _scanUsbDevices() async {
    setState(() {
      _isScanningUsb = true;
      _usbDevices.clear();
    });

    try {
      PrinterManager.instance
          .discovery(type: PrinterType.usb, isBle: false)
          .listen((device) {
            if (!mounted) return;
            setState(() {
              if (!_usbDevices.any(
                (d) =>
                    d.vendorId == device.vendorId &&
                    d.productId == device.productId,
              )) {
                _usbDevices.add(device);
              }
            });
          });

      // Stop scanning after 3 seconds
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        setState(() {
          _isScanningUsb = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isScanningUsb = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error escaneando USB: $e')));
      }
    }
  }

  Future<void> _saveUsbDevice(PrinterDevice device) async {
    setState(() {
      _selectedUsbDevice = device;
      _savedUsbInfo = {
        'vendorId': device.vendorId ?? '',
        'productId': device.productId ?? '',
      };
    });
    await _secureStorage.writeUsbPrinter(
      device.vendorId ?? '',
      device.productId ?? '',
    );
  }

  Future<void> _scanBluetoothDevices() async {
    if (!Platform.isAndroid) return;
    setState(() {
      _isScanningBluetooth = true;
    });

    try {
      final list = await BlueThermalPrinter.instance.getBondedDevices();
      if (mounted) {
        setState(() {
          _devices = list;
          if (_printerAddress != null && _printerAddress!.isNotEmpty) {
            final found = list.where((d) => d.address == _printerAddress);
            if (found.isNotEmpty) {
              _selectedDevice = found.first;
            }
          }
        });
      }
    } catch (e) {
      print("Error scanning bonded devices: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isScanningBluetooth = false;
        });
      }
    }
  }

  Future<void> _connectPrinter() async {
    if (_selectedDevice == null || !Platform.isAndroid) return;
    setState(() {
      _isConnecting = true;
    });

    try {
      final isConn = await BlueThermalPrinter.instance.isConnected;
      if (isConn == true) {
        await BlueThermalPrinter.instance.disconnect();
      }

      await BlueThermalPrinter.instance.connect(_selectedDevice!);
      final checked = await BlueThermalPrinter.instance.isConnected;
      setState(() {
        _isConnected = checked == true;
      });

      if (checked == true) {
        await _secureStorage.writePrinterAddress(
          _selectedDevice!.address ?? '',
        );
        await _secureStorage.writePrinterEnabled(true);
        _showSnackBar(
          'Impresora vinculada y conectada con éxito.',
          const Color(0xFF0D9488),
        );
      } else {
        _showSnackBar(
          'No se pudo conectar a la impresora.',
          Theme.of(context).colorScheme.error,
        );
      }
    } catch (e) {
      _showSnackBar(
        'Error de conexión: $e',
        Theme.of(context).colorScheme.error,
      );
    } finally {
      setState(() {
        _isConnecting = false;
      });
    }
  }

  Future<void> _savePrinterType(String type) async {
    setState(() {
      _printerType = type;
    });
    await _secureStorage.writePrinterType(type);
    final enabled = type != 'none';
    await _secureStorage.writePrinterEnabled(enabled);

    ref.invalidate(printerEnabledProvider);

    if (type == 'bluetooth' && _devices.isEmpty) {
      _scanBluetoothDevices();
    }
  }

  Future<void> _savePrinterWidth(int width) async {
    setState(() {
      _printerWidth = width;
    });
    await _secureStorage.writePrinterWidth(width);
  }

  Future<void> _printTestPage() async {
    String widthLabel = '58mm';
    if (_printerWidth == 48)
      widthLabel = '80mm';
    else if (_printerWidth != 32)
      widthLabel = '58mm (${_printerWidth}c)';

    String border = "=" * _printerWidth;

    // Create ticket text dynamically based on width
    final String testTicket =
        "$border\n"
        "PAGINA DE PRUEBA\n"
        "$border\n"
        "Tipo Imp : ${_printerType.toUpperCase()}\n"
        "Ancho    : $widthLabel ($_printerWidth col)\n"
        "Estado   : CONECTADA\n"
        "$border\n"
        "   IMPRESION DE PRUEBA EXITOSA  \n"
        "$border\n\n\n\n";

    await ref.read(printerServiceProvider).printTicket(context, testTicket);
  }

  void _showSnackBar(String text, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Impresión'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ANCHO DEL TICKET (PAPEL)',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D9488),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            _buildWidthSelectionCard(),
            const SizedBox(height: 28),

            const Text(
              'TIPO DE IMPRESORA',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D9488),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            _buildPrinterSetupCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildWidthSelectionCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(child: _buildWidthButton(32, '58mm\n(32 col)')),
            const SizedBox(width: 8),
            Expanded(child: _buildWidthButton(38, '58mm\n(38 col)')),
            const SizedBox(width: 8),
            Expanded(child: _buildWidthButton(42, '58mm\n(42 col)')),
            const SizedBox(width: 8),
            Expanded(child: _buildWidthButton(48, '80mm\n(48 col)')),
          ],
        ),
      ),
    );
  }

  Future<void> _savePrinterFontSize(int size) async {
    setState(() {
      _printerFontSize = size;
    });
    await _secureStorage.writePrinterFontSize(size);
  }

  Widget _buildFontSizeButton(int size, String label) {
    final isSelected = _printerFontSize == size;
    final color = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF1E293B);
    final borderColor = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF334155);

    return InkWell(
      onTap: () => _savePrinterFontSize(size),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildWidthButton(int width, String label) {
    final isSelected = _printerWidth == width;
    final color = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF1E293B);
    final borderColor = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF334155);

    return InkWell(
      onTap: () => _savePrinterWidth(width),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildPrinterSetupCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Platform specific choices
            if (Platform.isAndroid)
              Row(
                children: [
                  Expanded(
                    child: _buildTypeButton(
                      'none',
                      'Ninguna',
                      Icons.print_disabled,
                    ),
                  ),
                  if (Platform.isAndroid) ...[
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildTypeButton(
                        'integrated',
                        'Integrada',
                        Icons.print,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTypeButton('usb', 'USB', Icons.usb)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildTypeButton(
                        'bluetooth',
                        'Bluetooth',
                        Icons.bluetooth,
                      ),
                    ),
                  ],
                ],
              )
            else if (Platform.isWindows)
              Row(
                children: [
                  Expanded(
                    child: _buildTypeButton(
                      'none',
                      'Ninguna',
                      Icons.print_disabled_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTypeButton(
                      'windows_system',
                      'Sistema (Windows)',
                      Icons.print_outlined,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: _buildTypeButton(
                      'none',
                      'Ninguna',
                      Icons.print_disabled_outlined,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 24),
            const Text(
              'Tamaño de Letra (Bluetooth)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildFontSizeButton(0, 'Pequeña')),
                const SizedBox(width: 8),
                Expanded(child: _buildFontSizeButton(1, 'Mediana')),
                const SizedBox(width: 8),
                Expanded(child: _buildFontSizeButton(2, 'Grande')),
              ],
            ),
            const SizedBox(height: 24),
            if (_printerType == 'usb' && Platform.isAndroid) ...[
              const Divider(height: 20, color: Color(0xFF334155)),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Dispositivos USB Detectados:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _isScanningUsb ? null : _scanUsbDevices,
                    icon: _isScanningUsb
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.search, size: 18),
                    label: Text(_isScanningUsb ? 'Buscando...' : 'Escanear'),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              if (_usbDevices.isEmpty && !_isScanningUsb)
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Text(
                    'No se encontraron impresoras USB internas.\nAsegúrate de conectar/encender la terminal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF94A3B8)),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _usbDevices.length,
                  itemBuilder: (context, index) {
                    final device = _usbDevices[index];
                    final isSelected =
                        _savedUsbInfo?['vendorId'] == device.vendorId &&
                        _savedUsbInfo?['productId'] == device.productId;

                    return Card(
                      color: isSelected
                          ? const Color(0xFF0D9488).withOpacity(0.15)
                          : const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFF0D9488)
                              : const Color(0xFF334155),
                          width: 1.5,
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(
                          Icons.usb,
                          color: isSelected
                              ? const Color(0xFF0D9488)
                              : const Color(0xFF94A3B8),
                        ),
                        title: Text(
                          device.name ?? 'USB Printer',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Vendor: ${device.vendorId} | Product: ${device.productId}',
                        ),
                        trailing: isSelected
                            ? const Icon(
                                Icons.check_circle,
                                color: Color(0xFF0D9488),
                              )
                            : null,
                        onTap: () => _saveUsbDevice(device),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 16),
            ],

            if (_printerType == 'bluetooth' && Platform.isAndroid) ...[
              const Divider(height: 20, color: Color(0xFF334155)),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dispositivo Bluetooth:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: _isScanningBluetooth
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.refresh, color: Color(0xFF0D9488)),
                    onPressed: _isScanningBluetooth
                        ? null
                        : _scanBluetoothDevices,
                    tooltip: 'Escanear',
                  ),
                ],
              ),
              const SizedBox(height: 10),

              if (_devices.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7F1D1D).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF991B1B)),
                  ),
                  child: const Text(
                    'No se encontraron dispositivos Bluetooth emparejados. Vincula tu impresora en los ajustes de Android primero.',
                    style: TextStyle(
                      color: Color(0xFFFECACA),
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                )
              else ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<BluetoothDevice>(
                      value: _selectedDevice,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF1E293B),
                      hint: const Text(
                        'Selecciona una impresora...',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                      items: _devices.map((device) {
                        return DropdownMenuItem<BluetoothDevice>(
                          value: device,
                          child: Text(
                            '${device.name} (${device.address})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (device) {
                        setState(() {
                          _selectedDevice = device;
                          _isConnected = false;
                        });
                        // Auto-connect when selected
                        _connectPrinter();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ],

            if (_printerType == 'integrated' && Platform.isAndroid) ...[
              const Divider(height: 20, color: Color(0xFF334155)),
              const SizedBox(height: 12),

              const Text(
                'Modelo de Terminal (Integrada):',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3.0,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildModelButton('sunmi', 'Sunmi (V2, T2)'),
                  _buildModelButton('z100', 'Z100 / CS10'),
                  _buildModelButton('imin', 'iMin (M2, D2)'),
                  _buildModelButton('nexgo', 'NEXGO'),
                  _buildModelButton('telpo', 'Telpo'),
                ],
              ),
              const SizedBox(height: 16),
            ],

            if (_printerType == 'windows_system' && Platform.isWindows) ...[
              const Divider(height: 20, color: Color(0xFF334155)),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF334155).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF334155)),
                ),
                child: const Text(
                  'Las impresoras del sistema de Windows se configurarán una vez que el SDK nativo esté integrado.',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Action row
            if (_printerType != 'none')
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      // If bluetooth and Android, enable only if connected. If integrated or windows, always enable to test simulated flow.
                      onPressed: (_printerType == 'bluetooth' && !_isConnected)
                          ? null
                          : _printTestPage,
                      icon: const Icon(Icons.print_outlined),
                      label: const Text('Imprimir Prueba'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD97706),
                        disabledBackgroundColor: const Color(0xFF1E293B),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(String type, String label, IconData icon) {
    final isSelected = _printerType == type;
    final color = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF1E293B);
    final borderColor = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF334155);

    return InkWell(
      onTap: () => _savePrinterType(type),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF94A3B8),
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF94A3B8),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveIntegratedModel(String model) async {
    setState(() {
      _integratedModel = model;
    });
    await _secureStorage.writeIntegratedModel(model);
  }

  Widget _buildModelButton(String model, String label) {
    final isSelected = _integratedModel == model;
    final color = isSelected
        ? const Color(0xFF0D9488).withOpacity(0.2)
        : const Color(0xFF1E293B);
    final borderColor = isSelected
        ? const Color(0xFF0D9488)
        : const Color(0xFF334155);

    return InkWell(
      onTap: () => _saveIntegratedModel(model),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
