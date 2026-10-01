// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despacho.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DespachoImpl _$$DespachoImplFromJson(Map<String, dynamic> json) =>
    _$DespachoImpl(
      id: json['id'] as String,
      positionId: (json['position_id'] as num).toInt(),
      product: $enumDecode(_$ProductTypeEnumMap, json['product']),
      liters: (json['liters'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      pricePerLiter: (json['price_per_liter'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isInvoiced: json['is_invoiced'] as bool? ?? false,
    );

Map<String, dynamic> _$$DespachoImplToJson(_$DespachoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position_id': instance.positionId,
      'product': _$ProductTypeEnumMap[instance.product]!,
      'liters': instance.liters,
      'amount': instance.amount,
      'price_per_liter': instance.pricePerLiter,
      'timestamp': instance.timestamp.toIso8601String(),
      'is_invoiced': instance.isInvoiced,
    };

const _$ProductTypeEnumMap = {
  ProductType.magna: 'MAGNA',
  ProductType.premium: 'PREMIUM',
  ProductType.diesel: 'DIESEL',
};
