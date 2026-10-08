import 'package:dio/dio.dart';
import '../models/cliente.dart';
import 'cliente_repository.dart';

class ApiClienteRepository implements ClienteRepository {
  final Dio _dio;

  ApiClienteRepository(this._dio);

  @override
  Future<List<Cliente>> searchClientes(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      final response = await _dio.get(
        '/api/v1/clientes/search',
        queryParameters: {'q': query.trim()},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['success'] == true) {
          final List<dynamic> jsonList = data['data'] ?? [];
          return jsonList.map((json) => Cliente.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      // Return empty or throw error based on your error handling preferences
      print('Error searching clientes: ');
      return [];
    }
  }
}
