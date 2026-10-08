import 'package:flutter/material.dart';

class NfcSettingsView extends StatelessWidget {
  const NfcSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración NFC'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.contactless_outlined, size: 64, color: Color(0xFF64748B)),
              SizedBox(height: 24),
              Text(
                'Lector NFC',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                'Esta función se activará en futuras actualizaciones si se requieren tarjetas de proximidad.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
