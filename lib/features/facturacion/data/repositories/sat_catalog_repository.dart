import '../models/sat_catalogs.dart';

abstract class SatCatalogRepository {
  Future<List<FormaPago>> getFormasDePago();
  Future<List<UsoCfdi>> getUsosCfdi();
}
