import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/despacho.dart';
import '../../data/providers/repository_providers.dart';

part 'sales_provider.g.dart';

@riverpod
Future<List<Despacho>> pumpSales(PumpSalesRef ref, int positionId) {
  final repository = ref.watch(despachoRepositoryProvider);
  return repository.getDespachosByPosition(positionId);
}
