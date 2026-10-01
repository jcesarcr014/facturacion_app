import 'package:freezed_annotation/freezed_annotation.dart';

part 'despacho.freezed.dart';
part 'despacho.g.dart';

enum ProductType {
  @JsonValue('MAGNA')
  magna,
  @JsonValue('PREMIUM')
  premium,
  @JsonValue('DIESEL')
  diesel,
}

@freezed
class Despacho with _$Despacho {
  const factory Despacho({
    required String id,
    @JsonKey(name: 'position_id') required int positionId,
    required ProductType product,
    required double liters,
    required double amount,
    @JsonKey(name: 'price_per_liter') required double pricePerLiter,
    required DateTime timestamp,
    @JsonKey(name: 'is_invoiced') @Default(false) bool isInvoiced,
  }) = _Despacho;

  factory Despacho.fromJson(Map<String, dynamic> json) =>
      _$DespachoFromJson(json);
}
