import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/cliente_repository.dart';
import '../../data/repositories/mock_cliente_repository.dart';
import '../../data/repositories/tag_repository.dart';
import '../../data/repositories/mock_tag_repository.dart';
import '../../data/repositories/facturacion_repository.dart';
import '../../data/repositories/mock_facturacion_repository.dart';

part 'billing_providers.g.dart';

@riverpod
ClienteRepository clienteRepository(ClienteRepositoryRef ref) {
  // Swappable provider - returning Mock version for now
  return MockClienteRepository();
}

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  // Swappable provider - returning Mock version for now
  return MockTagRepository();
}

@riverpod
FacturacionRepository facturacionRepository(FacturacionRepositoryRef ref) {
  // Swappable provider - returning Mock version for now
  return MockFacturacionRepository();
}
