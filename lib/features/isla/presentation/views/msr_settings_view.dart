import 'package:flutter/material.dart';
import 'dart:async';
import 'package:facturacion_app/core/services/msr_service.dart';

class MsrSettingsView extends StatefulWidget {
  const MsrSettingsView({super.key});

  @override
  State<MsrSettingsView> createState() => _MsrSettingsViewState();
}

class _MsrSettingsViewState extends State<MsrSettingsView> {
  int _selectedMode = 1;
  String _lastRead = '';
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  StreamSubscription? _msrSubscription;
  final MsrService _msrService = MsrService();

  @override
  void initState() {
    super.initState();
    _setupMsrListener();
  }

  void _setupMsrListener() {
    _msrSubscription?.cancel();
    if (_selectedMode == 2) {
      _msrSubscription = _msrService.onSwipe.listen((data) {
        _onRead(data);
      }, onError: (e) {
        print('Error MSR: ');
      });
    }
  }


  @override
  void dispose() {
    _msrSubscription?.cancel();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onRead(String data) {
    if (data.isEmpty) return;
    setState(() {
      _lastRead = data;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _controller.clear();
        _focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración Banda Magnética'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione el controlador de hardware para la tablet:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildModeOption(1, 'Controlador 1 (Modo Teclado / Wedge)', 'Captura pulsaciones rápidas emuladas. Común en POS básicos.'),
            const SizedBox(height: 12),
            _buildModeOption(2, 'Controlador 2 (Broadcast Genérico/Ciontek)', 'Escucha eventos internos de Android. Común en CS50/CS30.'),
            const SizedBox(height: 12),
            _buildModeOption(3, 'Controlador 3 (Modo Sunmi)', 'Requiere SDK oficial de Sunmi V2/T2.'),
            const SizedBox(height: 32),
            const Text(
              'Prueba de Lector',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D9488),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _focusNode.requestFocus(),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF334155), width: 2),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.credit_card, size: 48, color: _lastRead.isEmpty ? const Color(0xFF64748B) : const Color(0xFF10B981)),
                          const SizedBox(height: 16),
                          Text(
                            _lastRead.isEmpty ? 'Pase la tarjeta por el lector ahora...' : 'Lectura Exitosa',
                            style: TextStyle(
                              color: _lastRead.isEmpty ? const Color(0xFF94A3B8) : const Color(0xFF10B981),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_lastRead.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              _lastRead,
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ]
                        ],
                      ),
                    ),
                    if (_selectedMode == 1)
                      Opacity(
                        opacity: 0.0,
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          autofocus: true,
                          onSubmitted: _onRead,
                          onChanged: (val) {
                            if (val.length > 5 && (val.contains('\n') || val.contains('?'))) {
                              _onRead(val);
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeOption(int mode, String title, String subtitle) {
    final isSelected = _selectedMode == mode;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMode = mode;
          _lastRead = '';
        });
        if (mode == 1) {
          Future.delayed(const Duration(milliseconds: 100), () => _focusNode.requestFocus());
        }
        _setupMsrListener();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0D9488).withOpacity(0.1) : const Color(0xFF1E293B),
          border: Border.all(color: isSelected ? const Color(0xFF0D9488) : const Color(0xFF334155)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? const Color(0xFF0D9488) : const Color(0xFF64748B),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
