import 'package:dio/dio.dart';
import '../models/sat_catalogs.dart';
import 'sat_catalog_repository.dart';

class ApiSatCatalogRepository implements SatCatalogRepository {
  final Dio dio;

  ApiSatCatalogRepository({required this.dio});

  @override
  Future<List<FormaPago>> getFormasDePago() async {
    try {
      final response = await dio.get('/api/sat/payment-methods');
      print('=== [DEBUG SAT] /api/sat/payment-methods => ${response.data} ===');
      final data = response.data;
      if (data != null && data is List) {
        return data.map((item) => FormaPago.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('=== [DEBUG SAT ERROR] Error al cargar Formas de Pago (/api/sat/payment-methods): $e ===');
      throw Exception('Error al cargar Formas de Pago: ${e.toString()}');
    }
  }

  @override
  Future<List<UsoCfdi>> getUsosCfdi() async {
    try {
      final response = await dio.get('/api/sat/cfdi-uses');
      print('=== [DEBUG SAT] /api/sat/cfdi-uses => ${response.data} ===');
      final data = response.data;
      if (data != null && data is List) {
        return data.map((item) => UsoCfdi.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('=== [DEBUG SAT ERROR] Error al cargar Usos CFDI (/api/sat/cfdi-uses): $e ===');
      throw Exception('Error al cargar Usos CFDI: ${e.toString()}');
    }
  }
}
