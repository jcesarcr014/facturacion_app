import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class RealNfcService {
  static const EventChannel _nfcChannel = EventChannel('com.antigravity.facturacion/nfc');
  
  Stream<String> get onNfcScan {
    return _nfcChannel.receiveBroadcastStream().map((event) => event.toString());
  }

  Future<String?> readTag(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const _NfcDialog(),
    );
  }
}

class _NfcDialog extends StatefulWidget {
  const _NfcDialog({Key? key}) : super(key: key);

  @override
  State<_NfcDialog> createState() => _NfcDialogState();
}

class _NfcDialogState extends State<_NfcDialog> {
  StreamSubscription? _sub;
  final RealNfcService _nfcService = RealNfcService();
  String? _scannedUid;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _sub = _nfcService.onNfcScan.listen((uid) {
      print('=== NFC RAW DATA RECEIVED ===: "$uid"');
      if (_isSuccess) return;

      setState(() {
        _scannedUid = uid;
        _isSuccess = true;
      });

      // Wait a moment so the user sees the success state, then pop
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context, uid);
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
              _isSuccess ? Icons.check_circle_outline : Icons.nfc_outlined,
              color: _isSuccess ? const Color(0xFF10B981) : const Color(0xFF3B82F6),
              size: 64,
            ),
            const SizedBox(height: 20),
            Text(
              _isSuccess ? '¡Tag Detectado!' : 'Acerque el TAG...',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: _isSuccess ? const Color(0xFF10B981) : Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            if (_isSuccess) ...[
              Text(
                'UID: $_scannedUid',
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ] else ...[
              const Text(
                'Acerque la tarjeta o llavero NFC a la parte posterior de la terminal.',
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

final realNfcServiceProvider = Provider<RealNfcService>((ref) {
  return RealNfcService();
});
