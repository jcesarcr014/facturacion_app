import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../repositories/isla_repository.dart';
import '../repositories/mock_isla_repository.dart';
import '../repositories/despacho_repository.dart';
import '../repositories/despacho_repository_impl.dart';

part 'repository_providers.g.dart';

@riverpod
IslaRepository islaRepository(IslaRepositoryRef ref) {
  // Swap MockIslaRepository with the real API repository when ready
  return MockIslaRepository();
}

@riverpod
DespachoRepository despachoRepository(DespachoRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return DespachoRepositoryImpl(dio);
}
