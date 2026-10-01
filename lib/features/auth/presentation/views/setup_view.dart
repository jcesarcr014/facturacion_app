import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class SetupView extends ConsumerStatefulWidget {
  const SetupView({super.key});

  @override
  ConsumerState<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends ConsumerState<SetupView> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authProvider.notifier).register(
          _urlController.text,
          _nameController.text,
          false,
        );

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'No se pudo conectar con el servidor. Verifica la URL e inténtalo de nuevo.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    
    // Safely check loading status from Freezed union type
    final bool isLoading = authState.maybeMap(
      registering: (_) => true,
      orElse: () => false,
    );

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 720;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: isTablet ? 980 : 450),
            margin: const EdgeInsets.all(24),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isTablet)
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 560,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              const Color(0xFF0F766E),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.local_gas_station,
                              color: Colors.white,
                              size: 72,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Facturación\nIntemperie',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    height: 1.1,
                                    fontSize: 36,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Registra la tablet de despacho en el sistema central para iniciar operaciones de pista.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.85),
                                  ),
                            ),
                            const SizedBox(height: 36),
                            _buildStep(context, '1', 'Configura la dirección del servidor (o usa "mock" para pruebas).'),
                            _buildStep(context, '2', 'Indica el nombre de la isla/bomba para el administrador.'),
                            _buildStep(context, '3', 'Completa la autorización remota desde el panel Laravel.'),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 6,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: isTablet ? 560 : 0),
                      child: Padding(
                        padding: EdgeInsets.all(isTablet ? 48.0 : 28.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!isTablet) ...[
                                Icon(
                                  Icons.local_gas_station,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 54,
                                ),
                                const SizedBox(height: 16),
                              ],
                              Text(
                                'Configuración Inicial',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Vincula la tablet de pista al backend administrativo.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 32),
                              TextFormField(
                                controller: _urlController,
                                enabled: !isLoading,
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Servidor API (URL)',
                                  hintText: 'ej. api.servidor.com o mock',
                                  prefixIcon: Icon(Icons.dns),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Ingresa la URL del backend';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _nameController,
                                enabled: !isLoading,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => _submit(),
                                decoration: const InputDecoration(
                                  labelText: 'Identificador del Dispositivo',
                                  hintText: 'ej. Isla 1 - Tablet A',
                                  prefixIcon: Icon(Icons.tablet_android),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Ingresa un nombre descriptivo';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 36),
                              isLoading
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: _submit,
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Vincular Terminal'),
                                          SizedBox(width: 12),
                                          Icon(Icons.arrow_forward),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.white24,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
