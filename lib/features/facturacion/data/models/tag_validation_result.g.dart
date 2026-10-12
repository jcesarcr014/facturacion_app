// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_validation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagValidationResultImpl _$$TagValidationResultImplFromJson(
  Map<String, dynamic> json,
) => _$TagValidationResultImpl(
  isValid: json['is_valid'] as bool,
  tipo: json['tipo'] as String?,
  clientName: json['client_name'] as String?,
  rfc: json['rfc'] as String?,
  plates: json['plates'] as String?,
  balance: (json['balance'] as num?)?.toDouble(),
  odoInicial: (json['odo_inicial'] as num?)?.toInt(),
  tieneSaldoSuficiente: json['tiene_saldo_suficiente'] as bool? ?? true,
  requiereNip: json['requiere_nip'] as bool? ?? false,
  errorMessage: json['error_message'] as String?,
);

Map<String, dynamic> _$$TagValidationResultImplToJson(
  _$TagValidationResultImpl instance,
) => <String, dynamic>{
  'is_valid': instance.isValid,
  'tipo': instance.tipo,
  'client_name': instance.clientName,
  'rfc': instance.rfc,
  'plates': instance.plates,
  'balance': instance.balance,
  'odo_inicial': instance.odoInicial,
  'tiene_saldo_suficiente': instance.tieneSaldoSuficiente,
  'requiere_nip': instance.requiereNip,
  'error_message': instance.errorMessage,
};
