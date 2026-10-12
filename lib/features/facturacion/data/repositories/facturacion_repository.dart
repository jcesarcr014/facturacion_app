import '../models/facturacion_response.dart';

abstract class FacturacionRepository {
  Future<FacturacionResponse> generateInvoice({
    required int despachoId,
    required String metodoPago,
    required String operatorCardUid,
    int? companyClientId,
    String? formaPago,
    String? usoCfdi,
    String? referenciaBancaria,
    String? codigoTag,
    String? nip,
    int? odoInicial,
    int? odoFinal,
    required int printerWidth,
  });
}
