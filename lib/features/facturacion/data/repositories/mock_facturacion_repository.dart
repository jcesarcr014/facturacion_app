import 'package:uuid/uuid.dart';
import '../models/facturacion_response.dart';
import 'facturacion_repository.dart';

class MockFacturacionRepository implements FacturacionRepository {
  @override
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
\${separator()}
\${center("ESTACION DE SERVICIO #1820")}
\${center("GRUPO COMBUSTIBLES DEL SUR")}
\${center("RFC: GCS150812ABC")}
\${center("CARR. NACIONAL KM 245")}
\${center("MONTERREY, N.L., CP 64000")}
\${separator()}
COMPROBANTE SIMULADO FACTURACION
FOLIO : \$despachoId
FISCAL: \${invoiceUuid.substring(0, 18)}
FECHA : \${timestamp.toString().substring(0, 19)}
DESP  : ID-\$operatorCardUid
PAGO  : \${metodoPago.toUpperCase()}
\${dashSeparator()}
CANTIDAD PRODUCTO TOTAL
\${dashSeparator()}
45.10 L  PREMIUM  \$1,118.48
\${dashSeparator()}
\${right("SUBTOTAL: \$967.54")}
\${right("IVA (16%): \$150.94")}
\${right("TOTAL: \$1,118.48")}
\${separator()}
\${center("FACTURA EMITIDA CON EXITO")}
\${center("REGIMEN GENERAL DE LEY")}
\${center("GRACIAS POR SU PREFERENCIA")}
\${separator()}
''';

    return FacturacionResponse(
      ticketRawText: rawText,
      invoiceUuid: invoiceUuid,
      timestamp: timestamp,
    );
  }
}
