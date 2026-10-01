import '../models/cliente.dart';

abstract class ClienteRepository {
  Future<List<Cliente>> searchClientes(String query);
}
