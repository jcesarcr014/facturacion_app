import '../models/cliente.dart';
import 'cliente_repository.dart';

class MockClienteRepository implements ClienteRepository {
  @override
  Future<List<Cliente>> searchClientes(String query) async {
    // Simulate 500ms network delay
    await Future.delayed(const Duration(milliseconds: 500));

    if (query.trim().isEmpty) return [];

    final q = query.trim().toUpperCase();

    return [
      Cliente(
        id: 1,
        rfc: 'GOMJ851020XYZ',
        razonSocial: 'JUAN GOMEZ MARTINEZ ($q)',
        email: 'juan.gomez@gmail.com',
      ),
      Cliente(
        id: 2,
        rfc: 'CSF150618ABC',
        razonSocial: 'CONSTRUCTORA SAN FRANCISCO S.A. DE C.V.',
        email: 'facturas@csanfrancisco.com.mx',
      ),
    ];
  }
}
