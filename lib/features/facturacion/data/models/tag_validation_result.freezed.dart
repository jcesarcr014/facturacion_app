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
  String? get tipo => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_name')
  String? get clientName => throw _privateConstructorUsedError;
  String? get rfc => throw _privateConstructorUsedError;
  String? get plates => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'odo_inicial')
  int? get odoInicial => throw _privateConstructorUsedError;
  @JsonKey(name: 'tiene_saldo_suficiente')
  bool get tieneSaldoSuficiente => throw _privateConstructorUsedError;
  @JsonKey(name: 'requiere_nip')
  bool get requiereNip => throw _privateConstructorUsedError;
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
    String? tipo,
    @JsonKey(name: 'client_name') String? clientName,
    String? rfc,
    String? plates,
    double? balance,
    @JsonKey(name: 'odo_inicial') int? odoInicial,
    @JsonKey(name: 'tiene_saldo_suficiente') bool tieneSaldoSuficiente,
    @JsonKey(name: 'requiere_nip') bool requiereNip,
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
    Object? tipo = freezed,
    Object? clientName = freezed,
    Object? rfc = freezed,
    Object? plates = freezed,
    Object? balance = freezed,
    Object? odoInicial = freezed,
    Object? tieneSaldoSuficiente = null,
    Object? requiereNip = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            tipo: freezed == tipo
                ? _value.tipo
                : tipo // ignore: cast_nullable_to_non_nullable
                      as String?,
            clientName: freezed == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                      as String?,
            rfc: freezed == rfc
                ? _value.rfc
                : rfc // ignore: cast_nullable_to_non_nullable
                      as String?,
            plates: freezed == plates
                ? _value.plates
                : plates // ignore: cast_nullable_to_non_nullable
                      as String?,
            balance: freezed == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double?,
            odoInicial: freezed == odoInicial
                ? _value.odoInicial
                : odoInicial // ignore: cast_nullable_to_non_nullable
                      as int?,
            tieneSaldoSuficiente: null == tieneSaldoSuficiente
                ? _value.tieneSaldoSuficiente
                : tieneSaldoSuficiente // ignore: cast_nullable_to_non_nullable
                      as bool,
            requiereNip: null == requiereNip
                ? _value.requiereNip
                : requiereNip // ignore: cast_nullable_to_non_nullable
                      as bool,
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
    String? tipo,
    @JsonKey(name: 'client_name') String? clientName,
    String? rfc,
    String? plates,
    double? balance,
    @JsonKey(name: 'odo_inicial') int? odoInicial,
    @JsonKey(name: 'tiene_saldo_suficiente') bool tieneSaldoSuficiente,
    @JsonKey(name: 'requiere_nip') bool requiereNip,
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
    Object? tipo = freezed,
    Object? clientName = freezed,
    Object? rfc = freezed,
    Object? plates = freezed,
    Object? balance = freezed,
    Object? odoInicial = freezed,
    Object? tieneSaldoSuficiente = null,
    Object? requiereNip = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TagValidationResultImpl(
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        tipo: freezed == tipo
            ? _value.tipo
            : tipo // ignore: cast_nullable_to_non_nullable
                  as String?,
        clientName: freezed == clientName
            ? _value.clientName
            : clientName // ignore: cast_nullable_to_non_nullable
                  as String?,
        rfc: freezed == rfc
            ? _value.rfc
            : rfc // ignore: cast_nullable_to_non_nullable
                  as String?,
        plates: freezed == plates
            ? _value.plates
            : plates // ignore: cast_nullable_to_non_nullable
                  as String?,
        balance: freezed == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double?,
        odoInicial: freezed == odoInicial
            ? _value.odoInicial
            : odoInicial // ignore: cast_nullable_to_non_nullable
                  as int?,
        tieneSaldoSuficiente: null == tieneSaldoSuficiente
            ? _value.tieneSaldoSuficiente
            : tieneSaldoSuficiente // ignore: cast_nullable_to_non_nullable
                  as bool,
        requiereNip: null == requiereNip
            ? _value.requiereNip
            : requiereNip // ignore: cast_nullable_to_non_nullable
                  as bool,
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
    this.tipo,
    @JsonKey(name: 'client_name') this.clientName,
    this.rfc,
    this.plates,
    this.balance,
    @JsonKey(name: 'odo_inicial') this.odoInicial,
    @JsonKey(name: 'tiene_saldo_suficiente') this.tieneSaldoSuficiente = true,
    @JsonKey(name: 'requiere_nip') this.requiereNip = false,
    @JsonKey(name: 'error_message') this.errorMessage,
  });

  factory _$TagValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagValidationResultImplFromJson(json);

  @override
  @JsonKey(name: 'is_valid')
  final bool isValid;
  @override
  final String? tipo;
  @override
  @JsonKey(name: 'client_name')
  final String? clientName;
  @override
  final String? rfc;
  @override
  final String? plates;
  @override
  final double? balance;
  @override
  @JsonKey(name: 'odo_inicial')
  final int? odoInicial;
  @override
  @JsonKey(name: 'tiene_saldo_suficiente')
  final bool tieneSaldoSuficiente;
  @override
  @JsonKey(name: 'requiere_nip')
  final bool requiereNip;
  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  @override
  String toString() {
    return 'TagValidationResult(isValid: $isValid, tipo: $tipo, clientName: $clientName, rfc: $rfc, plates: $plates, balance: $balance, odoInicial: $odoInicial, tieneSaldoSuficiente: $tieneSaldoSuficiente, requiereNip: $requiereNip, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.rfc, rfc) || other.rfc == rfc) &&
            (identical(other.plates, plates) || other.plates == plates) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.odoInicial, odoInicial) ||
                other.odoInicial == odoInicial) &&
            (identical(other.tieneSaldoSuficiente, tieneSaldoSuficiente) ||
                other.tieneSaldoSuficiente == tieneSaldoSuficiente) &&
            (identical(other.requiereNip, requiereNip) ||
                other.requiereNip == requiereNip) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isValid,
    tipo,
    clientName,
    rfc,
    plates,
    balance,
    odoInicial,
    tieneSaldoSuficiente,
    requiereNip,
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
    final String? tipo,
    @JsonKey(name: 'client_name') final String? clientName,
    final String? rfc,
    final String? plates,
    final double? balance,
    @JsonKey(name: 'odo_inicial') final int? odoInicial,
    @JsonKey(name: 'tiene_saldo_suficiente') final bool tieneSaldoSuficiente,
    @JsonKey(name: 'requiere_nip') final bool requiereNip,
    @JsonKey(name: 'error_message') final String? errorMessage,
  }) = _$TagValidationResultImpl;

  factory _TagValidationResult.fromJson(Map<String, dynamic> json) =
      _$TagValidationResultImpl.fromJson;

  @override
  @JsonKey(name: 'is_valid')
  bool get isValid;
  @override
  String? get tipo;
  @override
  @JsonKey(name: 'client_name')
  String? get clientName;
  @override
  String? get rfc;
  @override
  String? get plates;
  @override
  double? get balance;
  @override
  @JsonKey(name: 'odo_inicial')
  int? get odoInicial;
  @override
  @JsonKey(name: 'tiene_saldo_suficiente')
  bool get tieneSaldoSuficiente;
  @override
  @JsonKey(name: 'requiere_nip')
  bool get requiereNip;
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
