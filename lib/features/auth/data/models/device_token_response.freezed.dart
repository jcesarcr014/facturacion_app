// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IslandConfig _$IslandConfigFromJson(Map<String, dynamic> json) {
  return _IslandConfig.fromJson(json);
}

/// @nodoc
mixin _$IslandConfig {
  @JsonKey(fromJson: _parseInt)
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parsePositions)
  List<int> get positions => throw _privateConstructorUsedError;

  /// Serializes this IslandConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IslandConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IslandConfigCopyWith<IslandConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IslandConfigCopyWith<$Res> {
  factory $IslandConfigCopyWith(
    IslandConfig value,
    $Res Function(IslandConfig) then,
  ) = _$IslandConfigCopyWithImpl<$Res, IslandConfig>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _parseInt) int id,
    String name,
    @JsonKey(fromJson: _parsePositions) List<int> positions,
  });
}

/// @nodoc
class _$IslandConfigCopyWithImpl<$Res, $Val extends IslandConfig>
    implements $IslandConfigCopyWith<$Res> {
  _$IslandConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IslandConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? positions = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            positions: null == positions
                ? _value.positions
                : positions // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IslandConfigImplCopyWith<$Res>
    implements $IslandConfigCopyWith<$Res> {
  factory _$$IslandConfigImplCopyWith(
    _$IslandConfigImpl value,
    $Res Function(_$IslandConfigImpl) then,
  ) = __$$IslandConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _parseInt) int id,
    String name,
    @JsonKey(fromJson: _parsePositions) List<int> positions,
  });
}

/// @nodoc
class __$$IslandConfigImplCopyWithImpl<$Res>
    extends _$IslandConfigCopyWithImpl<$Res, _$IslandConfigImpl>
    implements _$$IslandConfigImplCopyWith<$Res> {
  __$$IslandConfigImplCopyWithImpl(
    _$IslandConfigImpl _value,
    $Res Function(_$IslandConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IslandConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? positions = null,
  }) {
    return _then(
      _$IslandConfigImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        positions: null == positions
            ? _value._positions
            : positions // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IslandConfigImpl implements _IslandConfig {
  const _$IslandConfigImpl({
    @JsonKey(fromJson: _parseInt) required this.id,
    required this.name,
    @JsonKey(fromJson: _parsePositions) required final List<int> positions,
  }) : _positions = positions;

  factory _$IslandConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$IslandConfigImplFromJson(json);

  @override
  @JsonKey(fromJson: _parseInt)
  final int id;
  @override
  final String name;
  final List<int> _positions;
  @override
  @JsonKey(fromJson: _parsePositions)
  List<int> get positions {
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

  @override
  String toString() {
    return 'IslandConfig(id: $id, name: $name, positions: $positions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IslandConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._positions,
              _positions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_positions),
  );

  /// Create a copy of IslandConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IslandConfigImplCopyWith<_$IslandConfigImpl> get copyWith =>
      __$$IslandConfigImplCopyWithImpl<_$IslandConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IslandConfigImplToJson(this);
  }
}

abstract class _IslandConfig implements IslandConfig {
  const factory _IslandConfig({
    @JsonKey(fromJson: _parseInt) required final int id,
    required final String name,
    @JsonKey(fromJson: _parsePositions) required final List<int> positions,
  }) = _$IslandConfigImpl;

  factory _IslandConfig.fromJson(Map<String, dynamic> json) =
      _$IslandConfigImpl.fromJson;

  @override
  @JsonKey(fromJson: _parseInt)
  int get id;
  @override
  String get name;
  @override
  @JsonKey(fromJson: _parsePositions)
  List<int> get positions;

  /// Create a copy of IslandConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IslandConfigImplCopyWith<_$IslandConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceTokenResponse _$DeviceTokenResponseFromJson(Map<String, dynamic> json) {
  return _DeviceTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$DeviceTokenResponse {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'island_config')
  IslandConfig get islandConfig => throw _privateConstructorUsedError;

  /// Serializes this DeviceTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceTokenResponseCopyWith<DeviceTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTokenResponseCopyWith<$Res> {
  factory $DeviceTokenResponseCopyWith(
    DeviceTokenResponse value,
    $Res Function(DeviceTokenResponse) then,
  ) = _$DeviceTokenResponseCopyWithImpl<$Res, DeviceTokenResponse>;
  @useResult
  $Res call({
    String token,
    @JsonKey(name: 'island_config') IslandConfig islandConfig,
  });

  $IslandConfigCopyWith<$Res> get islandConfig;
}

/// @nodoc
class _$DeviceTokenResponseCopyWithImpl<$Res, $Val extends DeviceTokenResponse>
    implements $DeviceTokenResponseCopyWith<$Res> {
  _$DeviceTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? islandConfig = null}) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            islandConfig: null == islandConfig
                ? _value.islandConfig
                : islandConfig // ignore: cast_nullable_to_non_nullable
                      as IslandConfig,
          )
          as $Val,
    );
  }

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IslandConfigCopyWith<$Res> get islandConfig {
    return $IslandConfigCopyWith<$Res>(_value.islandConfig, (value) {
      return _then(_value.copyWith(islandConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceTokenResponseImplCopyWith<$Res>
    implements $DeviceTokenResponseCopyWith<$Res> {
  factory _$$DeviceTokenResponseImplCopyWith(
    _$DeviceTokenResponseImpl value,
    $Res Function(_$DeviceTokenResponseImpl) then,
  ) = __$$DeviceTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String token,
    @JsonKey(name: 'island_config') IslandConfig islandConfig,
  });

  @override
  $IslandConfigCopyWith<$Res> get islandConfig;
}

/// @nodoc
class __$$DeviceTokenResponseImplCopyWithImpl<$Res>
    extends _$DeviceTokenResponseCopyWithImpl<$Res, _$DeviceTokenResponseImpl>
    implements _$$DeviceTokenResponseImplCopyWith<$Res> {
  __$$DeviceTokenResponseImplCopyWithImpl(
    _$DeviceTokenResponseImpl _value,
    $Res Function(_$DeviceTokenResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? islandConfig = null}) {
    return _then(
      _$DeviceTokenResponseImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        islandConfig: null == islandConfig
            ? _value.islandConfig
            : islandConfig // ignore: cast_nullable_to_non_nullable
                  as IslandConfig,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceTokenResponseImpl implements _DeviceTokenResponse {
  const _$DeviceTokenResponseImpl({
    required this.token,
    @JsonKey(name: 'island_config') required this.islandConfig,
  });

  factory _$DeviceTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceTokenResponseImplFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'island_config')
  final IslandConfig islandConfig;

  @override
  String toString() {
    return 'DeviceTokenResponse(token: $token, islandConfig: $islandConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceTokenResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.islandConfig, islandConfig) ||
                other.islandConfig == islandConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, islandConfig);

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceTokenResponseImplCopyWith<_$DeviceTokenResponseImpl> get copyWith =>
      __$$DeviceTokenResponseImplCopyWithImpl<_$DeviceTokenResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceTokenResponseImplToJson(this);
  }
}

abstract class _DeviceTokenResponse implements DeviceTokenResponse {
  const factory _DeviceTokenResponse({
    required final String token,
    @JsonKey(name: 'island_config') required final IslandConfig islandConfig,
  }) = _$DeviceTokenResponseImpl;

  factory _DeviceTokenResponse.fromJson(Map<String, dynamic> json) =
      _$DeviceTokenResponseImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'island_config')
  IslandConfig get islandConfig;

  /// Create a copy of DeviceTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceTokenResponseImplCopyWith<_$DeviceTokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
