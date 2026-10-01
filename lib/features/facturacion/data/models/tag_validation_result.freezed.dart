// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TagValidationResult _$TagValidationResultFromJson(Map<String, dynamic> json) {
  return _TagValidationResult.fromJson(json);
}

/// @nodoc
mixin _$TagValidationResult {
  @JsonKey(name: 'is_valid')
  bool get isValid => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_name')
  String? get clientName => throw _privateConstructorUsedError;
  String? get plates => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_message')
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this TagValidationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagValidationResultCopyWith<TagValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagValidationResultCopyWith<$Res> {
  factory $TagValidationResultCopyWith(
    TagValidationResult value,
    $Res Function(TagValidationResult) then,
  ) = _$TagValidationResultCopyWithImpl<$Res, TagValidationResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'is_valid') bool isValid,
    double? balance,
    @JsonKey(name: 'client_name') String? clientName,
    String? plates,
    @JsonKey(name: 'error_message') String? errorMessage,
  });
}

/// @nodoc
class _$TagValidationResultCopyWithImpl<$Res, $Val extends TagValidationResult>
    implements $TagValidationResultCopyWith<$Res> {
  _$TagValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? balance = freezed,
    Object? clientName = freezed,
    Object? plates = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            balance: freezed == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double?,
            clientName: freezed == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                      as String?,
            plates: freezed == plates
                ? _value.plates
                : plates // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TagValidationResultImplCopyWith<$Res>
    implements $TagValidationResultCopyWith<$Res> {
  factory _$$TagValidationResultImplCopyWith(
    _$TagValidationResultImpl value,
    $Res Function(_$TagValidationResultImpl) then,
  ) = __$$TagValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'is_valid') bool isValid,
    double? balance,
    @JsonKey(name: 'client_name') String? clientName,
    String? plates,
    @JsonKey(name: 'error_message') String? errorMessage,
  });
}

/// @nodoc
class __$$TagValidationResultImplCopyWithImpl<$Res>
    extends _$TagValidationResultCopyWithImpl<$Res, _$TagValidationResultImpl>
    implements _$$TagValidationResultImplCopyWith<$Res> {
  __$$TagValidationResultImplCopyWithImpl(
    _$TagValidationResultImpl _value,
    $Res Function(_$TagValidationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TagValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? balance = freezed,
    Object? clientName = freezed,
    Object? plates = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TagValidationResultImpl(
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        balance: freezed == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double?,
        clientName: freezed == clientName
            ? _value.clientName
            : clientName // ignore: cast_nullable_to_non_nullable
                  as String?,
        plates: freezed == plates
            ? _value.plates
            : plates // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TagValidationResultImpl implements _TagValidationResult {
  const _$TagValidationResultImpl({
    @JsonKey(name: 'is_valid') required this.isValid,
    this.balance,
    @JsonKey(name: 'client_name') this.clientName,
    this.plates,
    @JsonKey(name: 'error_message') this.errorMessage,
  });

  factory _$TagValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagValidationResultImplFromJson(json);

  @override
  @JsonKey(name: 'is_valid')
  final bool isValid;
  @override
  final double? balance;
  @override
  @JsonKey(name: 'client_name')
  final String? clientName;
  @override
  final String? plates;
  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  @override
  String toString() {
    return 'TagValidationResult(isValid: $isValid, balance: $balance, clientName: $clientName, plates: $plates, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.plates, plates) || other.plates == plates) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isValid,
    balance,
    clientName,
    plates,
    errorMessage,
  );

  /// Create a copy of TagValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagValidationResultImplCopyWith<_$TagValidationResultImpl> get copyWith =>
      __$$TagValidationResultImplCopyWithImpl<_$TagValidationResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TagValidationResultImplToJson(this);
  }
}

abstract class _TagValidationResult implements TagValidationResult {
  const factory _TagValidationResult({
    @JsonKey(name: 'is_valid') required final bool isValid,
    final double? balance,
    @JsonKey(name: 'client_name') final String? clientName,
    final String? plates,
    @JsonKey(name: 'error_message') final String? errorMessage,
  }) = _$TagValidationResultImpl;

  factory _TagValidationResult.fromJson(Map<String, dynamic> json) =
      _$TagValidationResultImpl.fromJson;

  @override
  @JsonKey(name: 'is_valid')
  bool get isValid;
  @override
  double? get balance;
  @override
  @JsonKey(name: 'client_name')
  String? get clientName;
  @override
  String? get plates;
  @override
  @JsonKey(name: 'error_message')
  String? get errorMessage;

  /// Create a copy of TagValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagValidationResultImplCopyWith<_$TagValidationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
