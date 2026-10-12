import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../models/facturacion_response.dart';
import '../utils/fiscal_ticket_formatter.dart';
import 'facturacion_repository.dart';

class ApiFacturacionRepository implements FacturacionRepository {
  final Dio dio;

  ApiFacturacionRepository(this.dio);

  @override
  Future<FacturacionResponse> generateInvoice({
    required int despachoId,
    required String metodoPago,
    required String operatorCardUid,
    int? companyClientId,
    String? formaPago,
    String? usoCfdi,
    String? referenciaBancaria,
    int? odoInicial,
    int? odoFinal,
    required int printerWidth,
  }) async {
    try {
      print('=== [DEBUG FACTURACION] INICIANDO PETICION ===');
      print('=== [DEBUG] Empleado/Despachador Card UID: $operatorCardUid ===');
      print('=== [DEBUG] Despacho ID: $despachoId ===');

      final payload = {
        "nDespachoID": despachoId,
        "metodo_pago": metodoPago,
        "operator_card_uid": operatorCardUid,
      };

      if (companyClientId != null) {
        payload["company_client_id"] = companyClientId;
      }
      if (formaPago != null) {
        payload["forma_pago"] = formaPago;
      }
      if (usoCfdi != null) {
        payload["uso_cfdi"] = usoCfdi;
      }
      if (referenciaBancaria != null && referenciaBancaria.isNotEmpty) {
        payload["referencia_bancaria"] = referenciaBancaria;
      }

      print('=== [DEBUG] URL: /api/v1/despachos/facturar ===');
      print('=== [DEBUG] PAYLOAD COMPLETO: $payload ===');

      final response = await dio.post('/api/v1/despachos/facturar', data: payload);
      
      print('=== [DEBUG] RESPUESTA STATUS: ${response.statusCode} ===');
      print('=== [DEBUG] RESPUESTA BODY: ${response.data} ===');

      final data = response.data;
      
      final int cols = printerWidth == 48 ? 48 : 32;

      // Generamos el ticket completo estructurado usando los datos del CFDI
      String formattedTicket;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        formattedTicket = FiscalTicketFormatter.format(data, cols: cols);
      } else if (data is Map<String, dynamic> && data['ticket_print_data'] != null && data['ticket_print_data']['raw_text'] != null) {
        formattedTicket = data['ticket_print_data']['raw_text'];
      } else {
        formattedTicket = FiscalTicketFormatter.format(data is Map<String, dynamic> ? data : {}, cols: cols);
      }

      final invoiceUuid = (data is Map<String, dynamic>)
          ? (data['data']?['comprobante']?['uuid'] ?? data['uuid'] ?? const Uuid().v4().toUpperCase())
          : const Uuid().v4().toUpperCase();

      final timestamp = DateTime.now();

      return FacturacionResponse(
        ticketRawText: formattedTicket,
        invoiceUuid: invoiceUuid,
        timestamp: timestamp,
      );
    } on DioException catch (e) {
      print('=== [DEBUG ERROR DIO] Mensaje: ${e.message} ===');
      print('=== [DEBUG ERROR DIO] Status: ${e.response?.statusCode} ===');
      print('=== [DEBUG ERROR DIO] Body Error: ${e.response?.data} ===');
      final errorMsg = e.response?.data?['message'] ?? e.message ?? 'Error al facturar el despacho';
      throw Exception(errorMsg);
    } catch (e, stack) {
      print('=== [DEBUG ERROR GENERAL] $e ===');
      print('=== [DEBUG STACK] $stack ===');
      throw Exception('Error inesperado: ${e.toString()}');
    }
  }
}
