import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/cliente_repository.dart';
import '../../data/repositories/api_cliente_repository.dart';
import '../../data/repositories/mock_cliente_repository.dart';
import '../../data/repositories/tag_repository.dart';
import '../../data/repositories/mock_tag_repository.dart';
import '../../data/repositories/api_tag_repository.dart';
import '../../data/repositories/facturacion_repository.dart';
import '../../data/repositories/mock_facturacion_repository.dart';
import '../../data/repositories/sat_catalog_repository.dart';
import '../../data/repositories/api_sat_catalog_repository.dart';
import '../../data/models/sat_catalogs.dart';
import '../../data/repositories/api_facturacion_repository.dart';
import '../../../../core/network/dio_client.dart';

part 'billing_providers.g.dart';

@riverpod
SatCatalogRepository satCatalogRepository(SatCatalogRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return ApiSatCatalogRepository(dio: dio);
}

@riverpod
ClienteRepository clienteRepository(ClienteRepositoryRef ref) {
  // Use real API repository instead of Mock
  final dio = ref.watch(dioClientProvider);
  return ApiClienteRepository(dio);
}

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return ApiTagRepository(dio);
}

@riverpod
FacturacionRepository facturacionRepository(FacturacionRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return ApiFacturacionRepository(dio);
}

@riverpod
Future<List<FormaPago>> formasDePago(FormasDePagoRef ref) {
  return ref.watch(satCatalogRepositoryProvider).getFormasDePago();
}

@riverpod
Future<List<UsoCfdi>> usosCfdi(UsosCfdiRef ref) {
  return ref.watch(satCatalogRepositoryProvider).getUsosCfdi();
}
