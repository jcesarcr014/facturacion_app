// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeviceRegisterRequest _$DeviceRegisterRequestFromJson(
  Map<String, dynamic> json,
) {
  return _DeviceRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$DeviceRegisterRequest {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this DeviceRegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceRegisterRequestCopyWith<DeviceRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceRegisterRequestCopyWith<$Res> {
  factory $DeviceRegisterRequestCopyWith(
    DeviceRegisterRequest value,
    $Res Function(DeviceRegisterRequest) then,
  ) = _$DeviceRegisterRequestCopyWithImpl<$Res, DeviceRegisterRequest>;
  @useResult
  $Res call({String uuid, String name});
}

/// @nodoc
class _$DeviceRegisterRequestCopyWithImpl<
  $Res,
  $Val extends DeviceRegisterRequest
>
    implements $DeviceRegisterRequestCopyWith<$Res> {
  _$DeviceRegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uuid = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            uuid: null == uuid
                ? _value.uuid
                : uuid // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeviceRegisterRequestImplCopyWith<$Res>
    implements $DeviceRegisterRequestCopyWith<$Res> {
  factory _$$DeviceRegisterRequestImplCopyWith(
    _$DeviceRegisterRequestImpl value,
    $Res Function(_$DeviceRegisterRequestImpl) then,
  ) = __$$DeviceRegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String name});
}

/// @nodoc
class __$$DeviceRegisterRequestImplCopyWithImpl<$Res>
    extends
        _$DeviceRegisterRequestCopyWithImpl<$Res, _$DeviceRegisterRequestImpl>
    implements _$$DeviceRegisterRequestImplCopyWith<$Res> {
  __$$DeviceRegisterRequestImplCopyWithImpl(
    _$DeviceRegisterRequestImpl _value,
    $Res Function(_$DeviceRegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeviceRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uuid = null, Object? name = null}) {
    return _then(
      _$DeviceRegisterRequestImpl(
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceRegisterRequestImpl implements _DeviceRegisterRequest {
  const _$DeviceRegisterRequestImpl({required this.uuid, required this.name});

  factory _$DeviceRegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceRegisterRequestImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;

  @override
  String toString() {
    return 'DeviceRegisterRequest(uuid: $uuid, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceRegisterRequestImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name);

  /// Create a copy of DeviceRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceRegisterRequestImplCopyWith<_$DeviceRegisterRequestImpl>
  get copyWith =>
      __$$DeviceRegisterRequestImplCopyWithImpl<_$DeviceRegisterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceRegisterRequestImplToJson(this);
  }
}

abstract class _DeviceRegisterRequest implements DeviceRegisterRequest {
  const factory _DeviceRegisterRequest({
    required final String uuid,
    required final String name,
  }) = _$DeviceRegisterRequestImpl;

  factory _DeviceRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$DeviceRegisterRequestImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;

  /// Create a copy of DeviceRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceRegisterRequestImplCopyWith<_$DeviceRegisterRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
