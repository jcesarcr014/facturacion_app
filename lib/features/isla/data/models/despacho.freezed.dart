// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'despacho.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Despacho _$DespachoFromJson(Map<String, dynamic> json) {
  return _Despacho.fromJson(json);
}

/// @nodoc
mixin _$Despacho {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_id')
  int get positionId => throw _privateConstructorUsedError;
  ProductType get product => throw _privateConstructorUsedError;
  double get liters => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_liter')
  double get pricePerLiter => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_invoiced')
  bool get isInvoiced => throw _privateConstructorUsedError;

  /// Serializes this Despacho to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Despacho
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DespachoCopyWith<Despacho> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DespachoCopyWith<$Res> {
  factory $DespachoCopyWith(Despacho value, $Res Function(Despacho) then) =
      _$DespachoCopyWithImpl<$Res, Despacho>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'position_id') int positionId,
    ProductType product,
    double liters,
    double amount,
    @JsonKey(name: 'price_per_liter') double pricePerLiter,
    DateTime timestamp,
    @JsonKey(name: 'is_invoiced') bool isInvoiced,
  });
}

/// @nodoc
class _$DespachoCopyWithImpl<$Res, $Val extends Despacho>
    implements $DespachoCopyWith<$Res> {
  _$DespachoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Despacho
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? positionId = null,
    Object? product = null,
    Object? liters = null,
    Object? amount = null,
    Object? pricePerLiter = null,
    Object? timestamp = null,
    Object? isInvoiced = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            positionId: null == positionId
                ? _value.positionId
                : positionId // ignore: cast_nullable_to_non_nullable
                      as int,
            product: null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ProductType,
            liters: null == liters
                ? _value.liters
                : liters // ignore: cast_nullable_to_non_nullable
                      as double,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            pricePerLiter: null == pricePerLiter
                ? _value.pricePerLiter
                : pricePerLiter // ignore: cast_nullable_to_non_nullable
                      as double,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isInvoiced: null == isInvoiced
                ? _value.isInvoiced
                : isInvoiced // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DespachoImplCopyWith<$Res>
    implements $DespachoCopyWith<$Res> {
  factory _$$DespachoImplCopyWith(
    _$DespachoImpl value,
    $Res Function(_$DespachoImpl) then,
  ) = __$$DespachoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'position_id') int positionId,
    ProductType product,
    double liters,
    double amount,
    @JsonKey(name: 'price_per_liter') double pricePerLiter,
    DateTime timestamp,
    @JsonKey(name: 'is_invoiced') bool isInvoiced,
  });
}

/// @nodoc
class __$$DespachoImplCopyWithImpl<$Res>
    extends _$DespachoCopyWithImpl<$Res, _$DespachoImpl>
    implements _$$DespachoImplCopyWith<$Res> {
  __$$DespachoImplCopyWithImpl(
    _$DespachoImpl _value,
    $Res Function(_$DespachoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Despacho
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? positionId = null,
    Object? product = null,
    Object? liters = null,
    Object? amount = null,
    Object? pricePerLiter = null,
    Object? timestamp = null,
    Object? isInvoiced = null,
  }) {
    return _then(
      _$DespachoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        positionId: null == positionId
            ? _value.positionId
            : positionId // ignore: cast_nullable_to_non_nullable
                  as int,
        product: null == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as ProductType,
        liters: null == liters
            ? _value.liters
            : liters // ignore: cast_nullable_to_non_nullable
                  as double,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        pricePerLiter: null == pricePerLiter
            ? _value.pricePerLiter
            : pricePerLiter // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isInvoiced: null == isInvoiced
            ? _value.isInvoiced
            : isInvoiced // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DespachoImpl implements _Despacho {
  const _$DespachoImpl({
    required this.id,
    @JsonKey(name: 'position_id') required this.positionId,
    required this.product,
    required this.liters,
    required this.amount,
    @JsonKey(name: 'price_per_liter') required this.pricePerLiter,
    required this.timestamp,
    @JsonKey(name: 'is_invoiced') this.isInvoiced = false,
  });

  factory _$DespachoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DespachoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'position_id')
  final int positionId;
  @override
  final ProductType product;
  @override
  final double liters;
  @override
  final double amount;
  @override
  @JsonKey(name: 'price_per_liter')
  final double pricePerLiter;
  @override
  final DateTime timestamp;
  @override
  @JsonKey(name: 'is_invoiced')
  final bool isInvoiced;

  @override
  String toString() {
    return 'Despacho(id: $id, positionId: $positionId, product: $product, liters: $liters, amount: $amount, pricePerLiter: $pricePerLiter, timestamp: $timestamp, isInvoiced: $isInvoiced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DespachoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.liters, liters) || other.liters == liters) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.pricePerLiter, pricePerLiter) ||
                other.pricePerLiter == pricePerLiter) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isInvoiced, isInvoiced) ||
                other.isInvoiced == isInvoiced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    positionId,
    product,
    liters,
    amount,
    pricePerLiter,
    timestamp,
    isInvoiced,
  );

  /// Create a copy of Despacho
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DespachoImplCopyWith<_$DespachoImpl> get copyWith =>
      __$$DespachoImplCopyWithImpl<_$DespachoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DespachoImplToJson(this);
  }
}

abstract class _Despacho implements Despacho {
  const factory _Despacho({
    required final String id,
    @JsonKey(name: 'position_id') required final int positionId,
    required final ProductType product,
    required final double liters,
    required final double amount,
    @JsonKey(name: 'price_per_liter') required final double pricePerLiter,
    required final DateTime timestamp,
    @JsonKey(name: 'is_invoiced') final bool isInvoiced,
  }) = _$DespachoImpl;

  factory _Despacho.fromJson(Map<String, dynamic> json) =
      _$DespachoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'position_id')
  int get positionId;
  @override
  ProductType get product;
  @override
  double get liters;
  @override
  double get amount;
  @override
  @JsonKey(name: 'price_per_liter')
  double get pricePerLiter;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(name: 'is_invoiced')
  bool get isInvoiced;

  /// Create a copy of Despacho
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DespachoImplCopyWith<_$DespachoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
