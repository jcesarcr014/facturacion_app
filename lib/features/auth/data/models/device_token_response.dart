import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_token_response.freezed.dart';
part 'device_token_response.g.dart';

int _parseInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

List<int> _parsePositions(dynamic value) {
  if (value is List) {
    return value.map((e) => _parseInt(e)).toList();
  }
  return [];
}

@freezed
class IslandConfig with _$IslandConfig {
  const factory IslandConfig({
    @JsonKey(fromJson: _parseInt) required int id,
    required String name,
    @JsonKey(fromJson: _parsePositions) required List<int> positions,
  }) = _IslandConfig;

  factory IslandConfig.fromJson(Map<String, dynamic> json) =>
      _$IslandConfigFromJson(json);
}

@freezed
class DeviceTokenResponse with _$DeviceTokenResponse {
  const factory DeviceTokenResponse({
    required String token,
    @JsonKey(name: 'island_config') required IslandConfig islandConfig,
  }) = _DeviceTokenResponse;

  factory DeviceTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenResponseFromJson(json);
}
