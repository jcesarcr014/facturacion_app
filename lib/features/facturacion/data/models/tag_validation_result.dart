import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_validation_result.freezed.dart';
part 'tag_validation_result.g.dart';

@freezed
class TagValidationResult with _$TagValidationResult {
  const factory TagValidationResult({
    @JsonKey(name: 'is_valid') required bool isValid,
    String? tipo,
    @JsonKey(name: 'client_name') String? clientName,
    String? rfc,
    String? plates,
    double? balance,
    @JsonKey(name: 'odo_inicial') int? odoInicial,
    @Default(true) @JsonKey(name: 'tiene_saldo_suficiente') bool tieneSaldoSuficiente,
    @Default(false) @JsonKey(name: 'requiere_nip') bool requiereNip,
    @JsonKey(name: 'error_message') String? errorMessage,
  }) = _TagValidationResult;

  factory TagValidationResult.fromJson(Map<String, dynamic> json) =>
      _$TagValidationResultFromJson(json);
}
