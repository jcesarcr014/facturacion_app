class FiscalTicketFormatter {
  static String format(Map<String, dynamic> responseData, {int cols = 32}) {
    final buffer = StringBuffer();

    // Helper functions
    String center(String text) {
      if (text.length >= cols) return text;
      final leftPad = ((cols - text.length) / 2).floor();
      return text.padLeft(text.length + leftPad).padRight(cols);
    }

    String divider([String char = '=']) => char * cols;

    String twoColumns(String left, String right) {
      final total = left.length + right.length;
      if (total >= cols) {
        return '$left $right';
      }
      final spaces = ' ' * (cols - total);
      return '$left$spaces$right';
    }

    List<String> wrap(String text, int width) {
      final lines = <String>[];
      for (var i = 0; i < text.length; i += width) {
        final end = (i + width < text.length) ? i + width : text.length;
        lines.add(text.substring(i, end));
      }
      return lines;
    }

    final data = responseData['data'] as Map<String, dynamic>? ?? responseData;
    final emisor = data['emisor'] as Map<String, dynamic>? ?? {};
    final comprobante = data['comprobante'] as Map<String, dynamic>? ?? {};
    final receptor = data['receptor'] as Map<String, dynamic>? ?? {};
    final conceptos = data['conceptos'] as List<dynamic>? ?? [];
    final timbre = data['timbre'] as Map<String, dynamic>? ?? {};

    // 1. ENCABEZADO - EMISOR
    final nombreComercial = emisor['nombre_comercial']?.toString() ?? 'ESTACION DE SERVICIO';
    final razonSocialEmisor = emisor['razon_social']?.toString() ?? '';
    final rfcEmisor = emisor['rfc']?.toString() ?? '';
    final regimenEmisor = emisor['regimen_fiscal']?.toString() ?? '';
    final direccionEmisor = emisor['direccion']?.toString() ?? '';
    final permisoCre = emisor['permiso_cre']?.toString() ?? '';

    buffer.writeln(divider('='));
    buffer.writeln(center(nombreComercial));
    if (razonSocialEmisor.isNotEmpty) {
      buffer.writeln(center(razonSocialEmisor));
    }
    buffer.writeln(divider('='));

    if (rfcEmisor.isNotEmpty || regimenEmisor.isNotEmpty) {
      buffer.writeln('RFC: $rfcEmisor');
      if (regimenEmisor.isNotEmpty) {
        buffer.writeln('REGIMEN: $regimenEmisor');
      }
    }

    buffer.writeln();
    buffer.writeln('Establecimiento que expide este comprobante:');
    if (direccionEmisor.isNotEmpty) {
      buffer.writeln(direccionEmisor);
    }
    if (permisoCre.isNotEmpty) {
      buffer.writeln('PERMISO CRE: $permisoCre');
    }

    // 2. DATOS DE LA FACTURA
    final serie = comprobante['serie']?.toString() ?? '';
    final folio = comprobante['folio']?.toString() ?? '';
    buffer.writeln(divider('_'));
    buffer.writeln(center('FACTURA'));
    buffer.writeln(center('$serie$folio'));
    buffer.writeln(divider('_'));

    // 3. RECEPTOR / CLIENTE
    final razonSocialCliente = receptor['razon_social']?.toString() ?? 'PUBLICO EN GENERAL';
    final rfcCliente = receptor['rfc']?.toString() ?? 'XAXX010101000';
    final usoCfdi = receptor['uso_cfdi']?.toString() ?? 'S01 - Sin efectos fiscales';
    final domicilioFiscal = receptor['domicilio_fiscal']?.toString() ?? '';
    final regimenCliente = receptor['regimen_fiscal']?.toString() ?? '';

    buffer.writeln(razonSocialCliente);
    buffer.writeln('RFC: $rfcCliente');
    buffer.writeln('USO CFDI: $usoCfdi');
    if (domicilioFiscal.isNotEmpty) {
      buffer.writeln('DOMICILIO FISCAL: $domicilioFiscal');
    }
    if (regimenCliente.isNotEmpty) {
      buffer.writeln('REGIMEN: $regimenCliente');
    }
    buffer.writeln(divider('_'));

    // 4. DATOS FISCALES DEL COMPROBANTE
    final uuid = comprobante['uuid']?.toString() ?? '';
    final csdEmisor = comprobante['no_certificado_emisor']?.toString() ?? '';
    final csdSat = comprobante['no_certificado_sat']?.toString() ?? '';
    final fechaEmision = comprobante['fecha_emision']?.toString() ?? '';
    final fechaCertificacion = comprobante['fecha_certificacion']?.toString() ?? '';
    final tipoComprobante = comprobante['tipo_comprobante']?.toString() ?? 'I - Ingreso';

    if (uuid.isNotEmpty) buffer.writeln('UUID: $uuid');
    if (csdEmisor.isNotEmpty) buffer.writeln('CSD EMISOR: $csdEmisor');
    if (csdSat.isNotEmpty) buffer.writeln('CSD SAT: $csdSat');
    if (fechaEmision.isNotEmpty) buffer.writeln('FECHA EMISION: $fechaEmision');
    if (fechaCertificacion.isNotEmpty) buffer.writeln('FECHA CERTIFICACION: $fechaCertificacion');
    buffer.writeln('TIPO COMPROBANTE: $tipoComprobante');
    buffer.writeln(divider('_'));

    // 5. CONCEPTOS / LINEAS DE DESPACHO
    buffer.writeln('Clave SAT   No.Ident   Cant   Unidad');
    buffer.writeln('Descripcion        Precio    Importe');
    buffer.writeln(divider('-'));

    for (final c in conceptos) {
      final claveSat = c['clave_sat']?.toString() ?? '';
      final noIdent = c['no_identificacion']?.toString() ?? '';
      final cantidad = c['cantidad']?.toString() ?? '';
      final unidad = c['unidad']?.toString() ?? '';
      final descripcion = c['descripcion']?.toString() ?? '';
      final precio = c['precio_unitario'] != null ? '\$${c['precio_unitario']}' : '';
      final importe = c['importe'] != null ? '\$${c['importe']}' : '';

      buffer.writeln('$claveSat $noIdent');
      buffer.writeln('  $cantidad $unidad');
      buffer.writeln(descripcion);
      buffer.writeln(twoColumns('  Precio: $precio', 'Importe: $importe'));
      buffer.writeln();
    }

    // 6. TOTALES E IMPUESTOS
    final subtotal = comprobante['subtotal'] != null ? '\$${comprobante['subtotal']}' : '';
    final iva = comprobante['iva'] != null ? '\$${comprobante['iva']}' : '';
    final total = comprobante['total'] != null ? '\$${comprobante['total']}' : '';
    final totalLetras = comprobante['total_letras']?.toString() ?? '';
    final metodoPago = comprobante['metodo_pago']?.toString() ?? 'PUE';
    final formaPago = comprobante['forma_pago']?.toString() ?? '01 - Efectivo';
    final moneda = comprobante['moneda']?.toString() ?? 'MXN';

    buffer.writeln(divider('_'));
    if (subtotal.isNotEmpty) buffer.writeln(twoColumns('Subtotal:', subtotal));
    if (iva.isNotEmpty) buffer.writeln(twoColumns('Impuestos Trasladados (IVA):', iva));
    if (total.isNotEmpty) buffer.writeln(twoColumns('TOTAL:', total));
    buffer.writeln();

    if (totalLetras.isNotEmpty) {
      buffer.writeln('($totalLetras)');
      buffer.writeln();
    }

    buffer.writeln(twoColumns('Metodo de Pago: $metodoPago', 'Moneda: $moneda'));
    buffer.writeln('Forma de Pago: $formaPago');
    buffer.writeln(divider('_'));

    // 7. TIMBRE FISCAL Y SELLOS
    final selloCfdi = timbre['sello_cfdi']?.toString() ?? '';
    final selloSat = timbre['sello_sat']?.toString() ?? '';
    final cadenaOriginal = timbre['cadena_original_sat']?.toString() ?? '';
    final qrUrl = timbre['qr_url']?.toString() ?? '';

    if (selloCfdi.isNotEmpty) {
      buffer.writeln('Sello digital del CFDI:');
      for (final line in wrap(selloCfdi, cols)) {
        buffer.writeln(line);
      }
      buffer.writeln();
    }

    if (selloSat.isNotEmpty) {
      buffer.writeln('Sello digital SAT:');
      for (final line in wrap(selloSat, cols)) {
        buffer.writeln(line);
      }
      buffer.writeln();
    }

    if (cadenaOriginal.isNotEmpty) {
      buffer.writeln('Cadena Original del SAT:');
      for (final line in wrap(cadenaOriginal, cols)) {
        buffer.writeln(line);
      }
      buffer.writeln();
    }

    if (qrUrl.isNotEmpty) {
      buffer.writeln(center('[CODIGO QR SAT]'));
      buffer.writeln('<<<QR:$qrUrl>>>');
      buffer.writeln();
    }

    // 8. PIE DE TICKET
    buffer.writeln(divider('='));
    buffer.writeln(center('Este documento es una representacion'));
    buffer.writeln(center('impresa de un CFDI'));
    buffer.writeln(center('**** Gracias por su compra ****'));
    buffer.writeln(divider('='));

    return buffer.toString();
  }
}
