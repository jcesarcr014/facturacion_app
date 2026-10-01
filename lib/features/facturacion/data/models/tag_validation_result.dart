import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_validation_result.freezed.dart';
part 'tag_validation_result.g.dart';

@freezed
class TagValidationResult with _$TagValidationResult {
  const factory TagValidationResult({
    @JsonKey(name: 'is_valid') required bool isValid,
    double? balance,
    @JsonKey(name: 'client_name') String? clientName,
    String? plates,
    @JsonKey(name: 'error_message') String? errorMessage,
  }) = _TagValidationResult;

  factory TagValidationResult.fromJson(Map<String, dynamic> json) =>
      _$TagValidationResultFromJson(json);
}
