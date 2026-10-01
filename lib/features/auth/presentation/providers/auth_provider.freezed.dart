// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$UnconfiguredImplCopyWith<$Res> {
  factory _$$UnconfiguredImplCopyWith(
    _$UnconfiguredImpl value,
    $Res Function(_$UnconfiguredImpl) then,
  ) = __$$UnconfiguredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$UnconfiguredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnconfiguredImpl>
    implements _$$UnconfiguredImplCopyWith<$Res> {
  __$$UnconfiguredImplCopyWithImpl(
    _$UnconfiguredImpl _value,
    $Res Function(_$UnconfiguredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? uuid = null}) {
    return _then(
      _$UnconfiguredImpl(
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnconfiguredImpl implements _Unconfigured {
  const _$UnconfiguredImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'AuthState.unconfigured(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnconfiguredImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnconfiguredImplCopyWith<_$UnconfiguredImpl> get copyWith =>
      __$$UnconfiguredImplCopyWithImpl<_$UnconfiguredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return unconfigured(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return unconfigured?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unconfigured != null) {
      return unconfigured(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return unconfigured(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return unconfigured?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unconfigured != null) {
      return unconfigured(this);
    }
    return orElse();
  }
}

abstract class _Unconfigured implements AuthState {
  const factory _Unconfigured({required final String uuid}) =
      _$UnconfiguredImpl;

  String get uuid;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnconfiguredImplCopyWith<_$UnconfiguredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisteringImplCopyWith<$Res> {
  factory _$$RegisteringImplCopyWith(
    _$RegisteringImpl value,
    $Res Function(_$RegisteringImpl) then,
  ) = __$$RegisteringImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisteringImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RegisteringImpl>
    implements _$$RegisteringImplCopyWith<$Res> {
  __$$RegisteringImplCopyWithImpl(
    _$RegisteringImpl _value,
    $Res Function(_$RegisteringImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisteringImpl implements _Registering {
  const _$RegisteringImpl();

  @override
  String toString() {
    return 'AuthState.registering()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisteringImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return registering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return registering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return registering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return registering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering(this);
    }
    return orElse();
  }
}

abstract class _Registering implements AuthState {
  const factory _Registering() = _$RegisteringImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
    _$UnauthorizedImpl value,
    $Res Function(_$UnauthorizedImpl) then,
  ) = __$$UnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String baseUrl,
    String uuid,
    String deviceName,
    String? errorMessage,
    bool isCheckingToken,
  });
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
    _$UnauthorizedImpl _value,
    $Res Function(_$UnauthorizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? uuid = null,
    Object? deviceName = null,
    Object? errorMessage = freezed,
    Object? isCheckingToken = null,
  }) {
    return _then(
      _$UnauthorizedImpl(
        baseUrl: null == baseUrl
            ? _value.baseUrl
            : baseUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCheckingToken: null == isCheckingToken
            ? _value.isCheckingToken
            : isCheckingToken // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl({
    required this.baseUrl,
    required this.uuid,
    required this.deviceName,
    this.errorMessage,
    this.isCheckingToken = false,
  });

  @override
  final String baseUrl;
  @override
  final String uuid;
  @override
  final String deviceName;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isCheckingToken;

  @override
  String toString() {
    return 'AuthState.unauthorized(baseUrl: $baseUrl, uuid: $uuid, deviceName: $deviceName, errorMessage: $errorMessage, isCheckingToken: $isCheckingToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isCheckingToken, isCheckingToken) ||
                other.isCheckingToken == isCheckingToken));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseUrl,
    uuid,
    deviceName,
    errorMessage,
    isCheckingToken,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return unauthorized(
      baseUrl,
      uuid,
      deviceName,
      errorMessage,
      isCheckingToken,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return unauthorized?.call(
      baseUrl,
      uuid,
      deviceName,
      errorMessage,
      isCheckingToken,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(
        baseUrl,
        uuid,
        deviceName,
        errorMessage,
        isCheckingToken,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements AuthState {
  const factory _Unauthorized({
    required final String baseUrl,
    required final String uuid,
    required final String deviceName,
    final String? errorMessage,
    final bool isCheckingToken,
  }) = _$UnauthorizedImpl;

  String get baseUrl;
  String get uuid;
  String get deviceName;
  String? get errorMessage;
  bool get isCheckingToken;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorizedImplCopyWith<$Res> {
  factory _$$AuthorizedImplCopyWith(
    _$AuthorizedImpl value,
    $Res Function(_$AuthorizedImpl) then,
  ) = __$$AuthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, IslandConfig islandConfig});

  $IslandConfigCopyWith<$Res> get islandConfig;
}

/// @nodoc
class __$$AuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthorizedImpl>
    implements _$$AuthorizedImplCopyWith<$Res> {
  __$$AuthorizedImplCopyWithImpl(
    _$AuthorizedImpl _value,
    $Res Function(_$AuthorizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null, Object? islandConfig = null}) {
    return _then(
      _$AuthorizedImpl(
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IslandConfigCopyWith<$Res> get islandConfig {
    return $IslandConfigCopyWith<$Res>(_value.islandConfig, (value) {
      return _then(_value.copyWith(islandConfig: value));
    });
  }
}

/// @nodoc

class _$AuthorizedImpl implements _Authorized {
  const _$AuthorizedImpl({required this.token, required this.islandConfig});

  @override
  final String token;
  @override
  final IslandConfig islandConfig;

  @override
  String toString() {
    return 'AuthState.authorized(token: $token, islandConfig: $islandConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.islandConfig, islandConfig) ||
                other.islandConfig == islandConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, islandConfig);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedImplCopyWith<_$AuthorizedImpl> get copyWith =>
      __$$AuthorizedImplCopyWithImpl<_$AuthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return authorized(token, islandConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return authorized?.call(token, islandConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(token, islandConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _Authorized implements AuthState {
  const factory _Authorized({
    required final String token,
    required final IslandConfig islandConfig,
  }) = _$AuthorizedImpl;

  String get token;
  IslandConfig get islandConfig;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizedImplCopyWith<_$AuthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String uuid) unconfigured,
    required TResult Function() registering,
    required TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )
    unauthorized,
    required TResult Function(String token, IslandConfig islandConfig)
    authorized,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String uuid)? unconfigured,
    TResult? Function()? registering,
    TResult? Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult? Function(String token, IslandConfig islandConfig)? authorized,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String uuid)? unconfigured,
    TResult Function()? registering,
    TResult Function(
      String baseUrl,
      String uuid,
      String deviceName,
      String? errorMessage,
      bool isCheckingToken,
    )?
    unauthorized,
    TResult Function(String token, IslandConfig islandConfig)? authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unconfigured value) unconfigured,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unconfigured value)? unconfigured,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unconfigured value)? unconfigured,
    TResult Function(_Registering value)? registering,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
