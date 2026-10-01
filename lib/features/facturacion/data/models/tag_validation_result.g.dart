// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_validation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagValidationResultImpl _$$TagValidationResultImplFromJson(
  Map<String, dynamic> json,
) => _$TagValidationResultImpl(
  isValid: json['is_valid'] as bool,
  balance: (json['balance'] as num?)?.toDouble(),
  clientName: json['client_name'] as String?,
  plates: json['plates'] as String?,
  errorMessage: json['error_message'] as String?,
);

Map<String, dynamic> _$$TagValidationResultImplToJson(
  _$TagValidationResultImpl instance,
) => <String, dynamic>{
  'is_valid': instance.isValid,
  'balance': instance.balance,
  'client_name': instance.clientName,
  'plates': instance.plates,
  'error_message': instance.errorMessage,
};
