// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClienteImpl _$$ClienteImplFromJson(Map<String, dynamic> json) =>
    _$ClienteImpl(
      rfc: json['rfc'] as String,
      razonSocial: json['razon_social'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ClienteImplToJson(_$ClienteImpl instance) =>
    <String, dynamic>{
      'rfc': instance.rfc,
      'razon_social': instance.razonSocial,
      'email': instance.email,
    };
