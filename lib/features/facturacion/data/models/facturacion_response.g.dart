// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facturacion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacturacionResponseImpl _$$FacturacionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FacturacionResponseImpl(
  ticketRawText: json['ticket_raw_text'] as String,
  invoiceUuid: json['invoice_uuid'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$FacturacionResponseImplToJson(
  _$FacturacionResponseImpl instance,
) => <String, dynamic>{
  'ticket_raw_text': instance.ticketRawText,
  'invoice_uuid': instance.invoiceUuid,
  'timestamp': instance.timestamp.toIso8601String(),
};
