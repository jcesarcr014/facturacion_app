import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:facturacion_app/core/network/secure_storage_service.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  late SecureStorageService _secureStorage;
  String _baseUrl = '';
  String _deviceName = '';
  String _deviceUuid = '';

  @override
  void initState() {
    super.initState();
    _secureStorage = ref.read(secureStorageServiceProvider);
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final url = await _secureStorage.readBaseUrl();
    final name = await _secureStorage.readDeviceName();
    final uuid = await _secureStorage.readDeviceUuid();

    setState(() {
      _baseUrl = url ?? '';
      _deviceName = name ?? '';
      _deviceUuid = uuid ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('INFORMACIÓN DEL TERMINAL'),
            const SizedBox(height: 12),
            _buildGeneralInfoCard(),
            const SizedBox(height: 28),

            _buildSectionHeader('MENÚ DE CONFIGURACIÓN'),
            const SizedBox(height: 12),
            _buildMenuCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D9488),
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildGeneralInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildInfoRow('Nombre Dispositivo', _deviceName, Icons.tablet_android),
            const Divider(height: 28, color: Color(0xFF334155)),
            _buildInfoRow('Servidor API', _baseUrl.isEmpty ? '-' : _baseUrl, Icons.dns_outlined),
            const Divider(height: 28, color: Color(0xFF334155)),
            _buildInfoRow('ID de Hardware', _deviceUuid, Icons.fingerprint),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF94A3B8), size: 22),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              SelectableText(
                value,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.print_outlined,
            title: 'Impresión y Tickets',
            subtitle: 'Conectar impresora y ajustar ancho del papel',
            onTap: () {
              context.push('/configuracion/impresora');
            },
          ),
          const Divider(height: 1, color: Color(0xFF334155)),
          _buildMenuItem(
            icon: Icons.credit_card,
            title: 'Lector de Banda Magnética',
            subtitle: 'Configurar lector para tarjetas de empleado',
            onTap: () {
              context.push('/configuracion/msr');
            },
          ),
          const Divider(height: 1, color: Color(0xFF334155)),
          _buildMenuItem(
            icon: Icons.contactless_outlined,
            title: 'Lector NFC',
            subtitle: 'Configurar lectura de proximidad (Opcional)',
            onTap: () {
              context.push('/configuracion/nfc');
            },
          ),
          const Divider(height: 1, color: Color(0xFF334155)),
          _buildMenuItem(
            icon: Icons.wifi,
            title: 'Red y API',
            subtitle: 'Ajustes del servidor (Próximamente)',
            onTap: () {
              // TODO: Network settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0D9488).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF0D9488)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8))),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
      onTap: onTap,
    );
  }
}

