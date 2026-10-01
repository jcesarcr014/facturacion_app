// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facturacion_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FacturacionResponse _$FacturacionResponseFromJson(Map<String, dynamic> json) {
  return _FacturacionResponse.fromJson(json);
}

/// @nodoc
mixin _$FacturacionResponse {
  @JsonKey(name: 'ticket_raw_text')
  String get ticketRawText => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_uuid')
  String get invoiceUuid => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this FacturacionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacturacionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacturacionResponseCopyWith<FacturacionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacturacionResponseCopyWith<$Res> {
  factory $FacturacionResponseCopyWith(
    FacturacionResponse value,
    $Res Function(FacturacionResponse) then,
  ) = _$FacturacionResponseCopyWithImpl<$Res, FacturacionResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'ticket_raw_text') String ticketRawText,
    @JsonKey(name: 'invoice_uuid') String invoiceUuid,
    DateTime timestamp,
  });
}

/// @nodoc
class _$FacturacionResponseCopyWithImpl<$Res, $Val extends FacturacionResponse>
    implements $FacturacionResponseCopyWith<$Res> {
  _$FacturacionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacturacionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketRawText = null,
    Object? invoiceUuid = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            ticketRawText: null == ticketRawText
                ? _value.ticketRawText
                : ticketRawText // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceUuid: null == invoiceUuid
                ? _value.invoiceUuid
                : invoiceUuid // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacturacionResponseImplCopyWith<$Res>
    implements $FacturacionResponseCopyWith<$Res> {
  factory _$$FacturacionResponseImplCopyWith(
    _$FacturacionResponseImpl value,
    $Res Function(_$FacturacionResponseImpl) then,
  ) = __$$FacturacionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ticket_raw_text') String ticketRawText,
    @JsonKey(name: 'invoice_uuid') String invoiceUuid,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$FacturacionResponseImplCopyWithImpl<$Res>
    extends _$FacturacionResponseCopyWithImpl<$Res, _$FacturacionResponseImpl>
    implements _$$FacturacionResponseImplCopyWith<$Res> {
  __$$FacturacionResponseImplCopyWithImpl(
    _$FacturacionResponseImpl _value,
    $Res Function(_$FacturacionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacturacionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketRawText = null,
    Object? invoiceUuid = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$FacturacionResponseImpl(
        ticketRawText: null == ticketRawText
            ? _value.ticketRawText
            : ticketRawText // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceUuid: null == invoiceUuid
            ? _value.invoiceUuid
            : invoiceUuid // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacturacionResponseImpl implements _FacturacionResponse {
  const _$FacturacionResponseImpl({
    @JsonKey(name: 'ticket_raw_text') required this.ticketRawText,
    @JsonKey(name: 'invoice_uuid') required this.invoiceUuid,
    required this.timestamp,
  });

  factory _$FacturacionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacturacionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ticket_raw_text')
  final String ticketRawText;
  @override
  @JsonKey(name: 'invoice_uuid')
  final String invoiceUuid;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'FacturacionResponse(ticketRawText: $ticketRawText, invoiceUuid: $invoiceUuid, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacturacionResponseImpl &&
            (identical(other.ticketRawText, ticketRawText) ||
                other.ticketRawText == ticketRawText) &&
            (identical(other.invoiceUuid, invoiceUuid) ||
                other.invoiceUuid == invoiceUuid) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ticketRawText, invoiceUuid, timestamp);

  /// Create a copy of FacturacionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacturacionResponseImplCopyWith<_$FacturacionResponseImpl> get copyWith =>
      __$$FacturacionResponseImplCopyWithImpl<_$FacturacionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FacturacionResponseImplToJson(this);
  }
}

abstract class _FacturacionResponse implements FacturacionResponse {
  const factory _FacturacionResponse({
    @JsonKey(name: 'ticket_raw_text') required final String ticketRawText,
    @JsonKey(name: 'invoice_uuid') required final String invoiceUuid,
    required final DateTime timestamp,
  }) = _$FacturacionResponseImpl;

  factory _FacturacionResponse.fromJson(Map<String, dynamic> json) =
      _$FacturacionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ticket_raw_text')
  String get ticketRawText;
  @override
  @JsonKey(name: 'invoice_uuid')
  String get invoiceUuid;
  @override
  DateTime get timestamp;

  /// Create a copy of FacturacionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacturacionResponseImplCopyWith<_$FacturacionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
