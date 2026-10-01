import 'package:dio/dio.dart';
import '../models/despacho.dart';
import 'despacho_repository.dart';

class DespachoRepositoryImpl implements DespachoRepository {
  final Dio _dio;

  DespachoRepositoryImpl(this._dio);

  @override
  Future<List<Despacho>> getDespachosByPosition(int positionId) async {
    final response = await _dio.get('/api/v1/positions/$positionId/despachos');
    
    // Assuming the API returns a JSON array of despachos in the 'data' field or directly
    final data = response.data['data'] ?? response.data;
    
    return (data as List).map((json) => Despacho.fromJson(json)).toList();
  }
}
