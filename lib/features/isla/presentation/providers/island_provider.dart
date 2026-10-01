import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/repository_providers.dart';

part 'island_provider.g.dart';

@riverpod
Future<List<int>> islandPositions(IslandPositionsRef ref) {
  final repository = ref.watch(islaRepositoryProvider);
  return repository.getPositions();
}
