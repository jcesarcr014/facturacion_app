// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cliente.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Cliente _$ClienteFromJson(Map<String, dynamic> json) {
  return _Cliente.fromJson(json);
}

/// @nodoc
mixin _$Cliente {
  int get id => throw _privateConstructorUsedError;
  String get rfc => throw _privateConstructorUsedError;
  @JsonKey(name: 'razon_social')
  String get razonSocial => throw _privateConstructorUsedError;
  @JsonKey(name: 'regimen_fiscal')
  String? get regimenFiscal => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_postal')
  String? get codigoPostal => throw _privateConstructorUsedError;
  @JsonKey(name: 'correos')
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this Cliente to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cliente
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClienteCopyWith<Cliente> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClienteCopyWith<$Res> {
  factory $ClienteCopyWith(Cliente value, $Res Function(Cliente) then) =
      _$ClienteCopyWithImpl<$Res, Cliente>;
  @useResult
  $Res call({
    int id,
    String rfc,
    @JsonKey(name: 'razon_social') String razonSocial,
    @JsonKey(name: 'regimen_fiscal') String? regimenFiscal,
    @JsonKey(name: 'codigo_postal') String? codigoPostal,
    @JsonKey(name: 'correos') String? email,
  });
}

/// @nodoc
class _$ClienteCopyWithImpl<$Res, $Val extends Cliente>
    implements $ClienteCopyWith<$Res> {
  _$ClienteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cliente
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rfc = null,
    Object? razonSocial = null,
    Object? regimenFiscal = freezed,
    Object? codigoPostal = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            rfc: null == rfc
                ? _value.rfc
                : rfc // ignore: cast_nullable_to_non_nullable
                      as String,
            razonSocial: null == razonSocial
                ? _value.razonSocial
                : razonSocial // ignore: cast_nullable_to_non_nullable
                      as String,
            regimenFiscal: freezed == regimenFiscal
                ? _value.regimenFiscal
                : regimenFiscal // ignore: cast_nullable_to_non_nullable
                      as String?,
            codigoPostal: freezed == codigoPostal
                ? _value.codigoPostal
                : codigoPostal // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClienteImplCopyWith<$Res> implements $ClienteCopyWith<$Res> {
  factory _$$ClienteImplCopyWith(
    _$ClienteImpl value,
    $Res Function(_$ClienteImpl) then,
  ) = __$$ClienteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String rfc,
    @JsonKey(name: 'razon_social') String razonSocial,
    @JsonKey(name: 'regimen_fiscal') String? regimenFiscal,
    @JsonKey(name: 'codigo_postal') String? codigoPostal,
    @JsonKey(name: 'correos') String? email,
  });
}

/// @nodoc
class __$$ClienteImplCopyWithImpl<$Res>
    extends _$ClienteCopyWithImpl<$Res, _$ClienteImpl>
    implements _$$ClienteImplCopyWith<$Res> {
  __$$ClienteImplCopyWithImpl(
    _$ClienteImpl _value,
    $Res Function(_$ClienteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Cliente
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rfc = null,
    Object? razonSocial = null,
    Object? regimenFiscal = freezed,
    Object? codigoPostal = freezed,
    Object? email = freezed,
  }) {
    return _then(
      _$ClienteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        rfc: null == rfc
            ? _value.rfc
            : rfc // ignore: cast_nullable_to_non_nullable
                  as String,
        razonSocial: null == razonSocial
            ? _value.razonSocial
            : razonSocial // ignore: cast_nullable_to_non_nullable
                  as String,
        regimenFiscal: freezed == regimenFiscal
            ? _value.regimenFiscal
            : regimenFiscal // ignore: cast_nullable_to_non_nullable
                  as String?,
        codigoPostal: freezed == codigoPostal
            ? _value.codigoPostal
            : codigoPostal // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClienteImpl implements _Cliente {
  const _$ClienteImpl({
    required this.id,
    required this.rfc,
    @JsonKey(name: 'razon_social') required this.razonSocial,
    @JsonKey(name: 'regimen_fiscal') this.regimenFiscal,
    @JsonKey(name: 'codigo_postal') this.codigoPostal,
    @JsonKey(name: 'correos') this.email,
  });

  factory _$ClienteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClienteImplFromJson(json);

  @override
  final int id;
  @override
  final String rfc;
  @override
  @JsonKey(name: 'razon_social')
  final String razonSocial;
  @override
  @JsonKey(name: 'regimen_fiscal')
  final String? regimenFiscal;
  @override
  @JsonKey(name: 'codigo_postal')
  final String? codigoPostal;
  @override
  @JsonKey(name: 'correos')
  final String? email;

  @override
  String toString() {
    return 'Cliente(id: $id, rfc: $rfc, razonSocial: $razonSocial, regimenFiscal: $regimenFiscal, codigoPostal: $codigoPostal, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClienteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rfc, rfc) || other.rfc == rfc) &&
            (identical(other.razonSocial, razonSocial) ||
                other.razonSocial == razonSocial) &&
            (identical(other.regimenFiscal, regimenFiscal) ||
                other.regimenFiscal == regimenFiscal) &&
            (identical(other.codigoPostal, codigoPostal) ||
                other.codigoPostal == codigoPostal) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rfc,
    razonSocial,
    regimenFiscal,
    codigoPostal,
    email,
  );

  /// Create a copy of Cliente
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClienteImplCopyWith<_$ClienteImpl> get copyWith =>
      __$$ClienteImplCopyWithImpl<_$ClienteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClienteImplToJson(this);
  }
}

abstract class _Cliente implements Cliente {
  const factory _Cliente({
    required final int id,
    required final String rfc,
    @JsonKey(name: 'razon_social') required final String razonSocial,
    @JsonKey(name: 'regimen_fiscal') final String? regimenFiscal,
    @JsonKey(name: 'codigo_postal') final String? codigoPostal,
    @JsonKey(name: 'correos') final String? email,
  }) = _$ClienteImpl;

  factory _Cliente.fromJson(Map<String, dynamic> json) = _$ClienteImpl.fromJson;

  @override
  int get id;
  @override
  String get rfc;
  @override
  @JsonKey(name: 'razon_social')
  String get razonSocial;
  @override
  @JsonKey(name: 'regimen_fiscal')
  String? get regimenFiscal;
  @override
  @JsonKey(name: 'codigo_postal')
  String? get codigoPostal;
  @override
  @JsonKey(name: 'correos')
  String? get email;

  /// Create a copy of Cliente
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClienteImplCopyWith<_$ClienteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
