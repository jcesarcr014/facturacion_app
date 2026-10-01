import 'package:freezed_annotation/freezed_annotation.dart';

part 'facturacion_response.freezed.dart';
part 'facturacion_response.g.dart';

@freezed
class FacturacionResponse with _$FacturacionResponse {
  const factory FacturacionResponse({
    @JsonKey(name: 'ticket_raw_text') required String ticketRawText,
    @JsonKey(name: 'invoice_uuid') required String invoiceUuid,
    required DateTime timestamp,
  }) = _FacturacionResponse;

  factory FacturacionResponse.fromJson(Map<String, dynamic> json) =>
      _$FacturacionResponseFromJson(json);
}
