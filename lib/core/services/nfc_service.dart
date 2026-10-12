import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:facturacion_app/core/services/msr_service.dart';

class NfcService {
  Future<String?> readCard(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const _MsrDialog(),
    );
  }
}

class _MsrDialog extends StatefulWidget {
  const _MsrDialog({Key? key}) : super(key: key);

  @override
  State<_MsrDialog> createState() => _MsrDialogState();
}

class _MsrDialogState extends State<_MsrDialog> {
  StreamSubscription? _sub;
  final MsrService _msrService = MsrService();
  String? _scannedNumber;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _sub = _msrService.onSwipe.listen((data) {
      if (_isSuccess) return;

      print('=== [DEBUG MSR] RAW SWIPE DATA: "$data" ===');
      // Clean the card data (remove $, %, ;, ?, ^ at start/end)
      // Example: %12345? -> 12345
      String clean = data.replaceAll(RegExp(r'^[\$\*\%\;\^\?]+|[\$\*\%\;\^\?]+$'), '').trim();
      
      // If there are multiple tracks separated by ?, just take the first part
      if (clean.contains('?')) {
        clean = clean.split('?').first;
      }
      print('=== [DEBUG MSR] TARJETA LIMPIA (ID DESPACHADOR): "$clean" ===');

      setState(() {
        _scannedNumber = clean;
        _isSuccess = true;
      });

      // Wait a moment so the user sees the success state, then pop
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context, clean);
        }
      });
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E293B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isSuccess ? Icons.check_circle_outline : Icons.credit_card_outlined,
              color: _isSuccess ? const Color(0xFF10B981) : const Color(0xFF0D9488),
              size: 64,
            ),
            const SizedBox(height: 20),
            Text(
              _isSuccess ? '¡Lectura Exitosa!' : 'Esperando Tarjeta...',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: _isSuccess ? const Color(0xFF10B981) : Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            if (_isSuccess) ...[
              Text(
                'ID: $_scannedNumber',
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ] else ...[
              const Text(
                'Pase la tarjeta de banda magnética del despachador por el lector.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              const CircularProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}

final nfcServiceProvider = Provider<NfcService>((ref) {
  return NfcService();
});
