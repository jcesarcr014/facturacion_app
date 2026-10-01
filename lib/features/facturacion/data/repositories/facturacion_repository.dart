import '../models/facturacion_response.dart';

abstract class FacturacionRepository {
  Future<FacturacionResponse> generateInvoice({
    required String despachoId,
    required String paymentType,
    String? rfc,
    String? tagId,
    int? odoInicial,
    int? odoFinal,
    required String dispatcherId,
    required int printerWidth,
  });
}
