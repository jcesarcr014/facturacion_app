import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/cliente_repository.dart';
import '../../data/repositories/api_cliente_repository.dart';
import '../../data/repositories/mock_cliente_repository.dart';
import '../../data/repositories/tag_repository.dart';
import '../../data/repositories/mock_tag_repository.dart';
import '../../data/repositories/facturacion_repository.dart';
import '../../data/repositories/mock_facturacion_repository.dart';
import '../../../../core/network/dio_client.dart';

part 'billing_providers.g.dart';

@riverpod
ClienteRepository clienteRepository(ClienteRepositoryRef ref) {
  // Use real API repository instead of Mock
  final dio = ref.watch(dioClientProvider);
  return ApiClienteRepository(dio);
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
