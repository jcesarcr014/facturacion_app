// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClienteImpl _$$ClienteImplFromJson(Map<String, dynamic> json) =>
    _$ClienteImpl(
      id: (json['id'] as num).toInt(),
      rfc: json['rfc'] as String,
      razonSocial: json['razon_social'] as String,
      regimenFiscal: json['regimen_fiscal'] as String?,
      codigoPostal: json['codigo_postal'] as String?,
      email: json['correos'] as String?,
    );

Map<String, dynamic> _$$ClienteImplToJson(_$ClienteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rfc': instance.rfc,
      'razon_social': instance.razonSocial,
      'regimen_fiscal': instance.regimenFiscal,
      'codigo_postal': instance.codigoPostal,
      'correos': instance.email,
    };
