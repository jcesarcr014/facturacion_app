import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nfc_service.g.dart';

class NfcService {
  Future<String?> readCard(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context, '04E2A89F10B380');
          }
        });

        return Dialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.contactless_outlined,
                  color: Color(0xFF0D9488),
                  size: 64,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Esperando Tarjeta...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Acerque la tarjeta despachador al lector NFC de la terminal.',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );

    return result;
  }
}

@riverpod
NfcService nfcService(NfcServiceRef ref) {
  return NfcService();
}
