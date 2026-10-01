// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IslandConfigImpl _$$IslandConfigImplFromJson(Map<String, dynamic> json) =>
    _$IslandConfigImpl(
      id: _parseInt(json['id']),
      name: json['name'] as String,
      positions: _parsePositions(json['positions']),
    );

Map<String, dynamic> _$$IslandConfigImplToJson(_$IslandConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'positions': instance.positions,
    };

_$DeviceTokenResponseImpl _$$DeviceTokenResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DeviceTokenResponseImpl(
  token: json['token'] as String,
  islandConfig: IslandConfig.fromJson(
    json['island_config'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$DeviceTokenResponseImplToJson(
  _$DeviceTokenResponseImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'island_config': instance.islandConfig,
};
