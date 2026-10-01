import 'package:uuid/uuid.dart';
import '../models/facturacion_response.dart';
import 'facturacion_repository.dart';

class MockFacturacionRepository implements FacturacionRepository {
  @override
  Future<FacturacionResponse> generateInvoice({
    required String despachoId,
    required String paymentType,
    String? rfc,
    String? tagId,
    int? odoInicial,
    int? odoFinal,
    required String dispatcherId,
    required int printerWidth,
  }) async {
    // Simulate 2 seconds billing processing time
    await Future.delayed(const Duration(seconds: 2));

    final invoiceUuid = const Uuid().v4().toUpperCase();
    final timestamp = DateTime.now();
    
    final int cols = printerWidth == 48 ? 48 : 32;
    
    String center(String text) {
      if (text.length >= cols) return text;
      final leftPad = ((cols - text.length) / 2).floor();
      return text.padLeft(text.length + leftPad).padRight(cols);
    }
    
    String right(String text) {
      if (text.length >= cols) return text;
      return text.padLeft(cols);
    }
    
    String separator() => '=' * cols;
    String dashSeparator() => '-' * cols;

    final rawText = '''
${separator()}
${center("ESTACION DE SERVICIO #1820")}
${center("GRUPO COMBUSTIBLES DEL SUR")}
${center("RFC: GCS150812ABC")}
${center("CARR. NACIONAL KM 245")}
${center("MONTERREY, N.L., CP 64000")}
${separator()}
COMPROBANTE SIMULADO FACTURACION
FOLIO : $despachoId
FISCAL: ${invoiceUuid.substring(0, 18)}
FECHA : ${timestamp.toString().substring(0, 19)}
DESP  : ID-$dispatcherId
PAGO  : ${paymentType.toUpperCase()}
${rfc != null ? 'RFC   : $rfc\n' : ''}${tagId != null ? 'TAG   : $tagId\n' : ''}${odoInicial != null ? 'ODO IN: $odoInicial KM\n' : ''}${odoFinal != null ? 'ODO FI: $odoFinal KM\n' : ''}${dashSeparator()}
CANTIDAD PRODUCTO TOTAL
${dashSeparator()}
45.10 L  PREMIUM  \$1,118.48
${dashSeparator()}
${right("SUBTOTAL: \$967.54")}
${right("IVA (16%): \$150.94")}
${right("TOTAL: \$1,118.48")}
${separator()}
${center("FACTURA EMITIDA CON EXITO")}
${center("REGIMEN GENERAL DE LEY")}
${center("GRACIAS POR SU PREFERENCIA")}
${separator()}
''';

    return FacturacionResponse(
      ticketRawText: rawText,
      invoiceUuid: invoiceUuid,
      timestamp: timestamp,
    );
  }
}
