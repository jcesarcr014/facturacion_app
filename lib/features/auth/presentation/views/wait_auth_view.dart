import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class WaitAuthView extends ConsumerWidget {
  const WaitAuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    // Safeguard to unpack unauthorized values from Freezed state
    final (deviceName, baseUrl, errorMessage, isChecking) = authState.maybeMap(
      unauthorized: (s) => (s.deviceName, s.baseUrl, s.errorMessage, s.isCheckingToken),
      orElse: () => ('-', '-', null, false),
    );

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 720;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: isTablet ? 720 : 450),
            margin: const EdgeInsets.all(24),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(isTablet ? 40.0 : 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: const Color(0xFFFEF3C7), // Amber background
                      child: Icon(
                        Icons.lock_clock_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 42,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Terminal en proceso de registro',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'En espera de autorización del administrador para iniciar el despacho.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _buildInfoRow(context, 'Terminal:', deviceName),
                          const Divider(height: 24, color: Color(0xFFE2E8F0)),
                          _buildInfoRow(context, 'Servidor:', baseUrl),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (errorMessage != null) ...[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF1F2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFECDD3)),
                        ),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, color: Color(0xFFE11D48)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                errorMessage,
                                style: const TextStyle(
                                  color: Color(0xFFBE123C),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    isChecking
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () => ref.read(authProvider.notifier).checkAuthorization(),
                                icon: const Icon(Icons.sync_outlined),
                                label: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('Verificar Autorización'),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: isChecking
                            ? null
                            : () {
                                ref.read(authProvider.notifier).logout();
                              },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF64748B),
                          side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Registrarse de nuevo'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF0F172A)),
          ),
        ),
      ],
    );
  }

}
