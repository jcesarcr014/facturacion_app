import 'package:freezed_annotation/freezed_annotation.dart';

part 'cliente.freezed.dart';
part 'cliente.g.dart';

@freezed
class Cliente with _$Cliente {
  const factory Cliente({
    required int id,
    required String rfc,
    @JsonKey(name: 'razon_social') required String razonSocial,
    @JsonKey(name: 'regimen_fiscal') String? regimenFiscal,
    @JsonKey(name: 'codigo_postal') String? codigoPostal,
    @JsonKey(name: 'correos') String? email,
  }) = _Cliente;

  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);
}
