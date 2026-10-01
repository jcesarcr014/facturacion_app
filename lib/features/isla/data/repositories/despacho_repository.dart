import '../models/despacho.dart';

abstract class DespachoRepository {
  Future<List<Despacho>> getDespachosByPosition(int positionId);
}
