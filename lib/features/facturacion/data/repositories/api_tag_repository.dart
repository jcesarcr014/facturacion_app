import 'package:dio/dio.dart';
import '../models/tag_validation_result.dart';
import 'tag_repository.dart';

class ApiTagRepository implements TagRepository {
  final Dio dio;

  ApiTagRepository(this.dio);

  @override
  Future<TagValidationResult> validateTag(String tagId) async {
    try {
      print('=== [DEBUG TAG] Consultando TAG en API: /api/v1/tags/$tagId ===');
      final response = await dio.get('/api/v1/tags/$tagId');
      print('=== [DEBUG TAG] Respuesta Status: ${response.statusCode} ===');
      print('=== [DEBUG TAG] Respuesta Data: ${response.data} ===');

      final data = response.data;
      if (data != null && data['success'] == true) {
        final client = data['client'] as Map<String, dynamic>?;
        final subcuenta = data['subcuenta'] as Map<String, dynamic>?;

        final balance = data['saldo_restante'] != null
            ? double.tryParse(data['saldo_restante'].toString())
            : null;

        final odoInicial = data['odo_inicial'] != null
            ? int.tryParse(data['odo_inicial'].toString())
            : null;

        final tieneSaldoSuficiente = data['tiene_saldo_suficiente'] != false;
        final requiereNip = subcuenta?['requiere_nip'] == true;
        final tipo = data['tipo']?.toString() ?? subcuenta?['tipo_cuenta']?.toString() ?? 'credito';

        if (!tieneSaldoSuficiente) {
          return TagValidationResult(
            isValid: false,
            tipo: tipo,
            clientName: client?['business_name']?.toString(),
            rfc: client?['rfc']?.toString(),
            plates: subcuenta?['descripcion']?.toString(),
            balance: balance,
            odoInicial: odoInicial,
            tieneSaldoSuficiente: false,
            requiereNip: requiereNip,
            errorMessage: 'La cuenta no cuenta con saldo suficiente para completar esta operación.',
          );
        }

        return TagValidationResult(
          isValid: true,
          tipo: tipo,
          clientName: client?['business_name']?.toString(),
          rfc: client?['rfc']?.toString(),
          plates: subcuenta?['descripcion']?.toString(),
          balance: balance,
          odoInicial: odoInicial,
          tieneSaldoSuficiente: true,
          requiereNip: requiereNip,
        );
      } else {
        return TagValidationResult(
          isValid: false,
          errorMessage: data?['message']?.toString() ?? 'El TAG no es válido o no se encuentra registrado.',
        );
      }
    } on DioException catch (e) {
      print('=== [DEBUG TAG ERROR DIO] ${e.response?.data} ===');
      final msg = e.response?.data?['message'] ?? e.message ?? 'Error al validar el TAG';
      return TagValidationResult(
        isValid: false,
        errorMessage: msg.toString(),
      );
    } catch (e) {
      print('=== [DEBUG TAG ERROR GENERAL] $e ===');
      return TagValidationResult(
        isValid: false,
        errorMessage: e.toString(),
      );
    }
  }
}
