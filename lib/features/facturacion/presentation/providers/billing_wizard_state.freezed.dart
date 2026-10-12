// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_wizard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BillingWizardState {
  PaymentMode get paymentMode => throw _privateConstructorUsedError;
  ContadoType get contadoType => throw _privateConstructorUsedError;
  String get rfcQuery => throw _privateConstructorUsedError;
  List<Cliente> get searchedClientes => throw _privateConstructorUsedError;
  bool get isSearchingClientes => throw _privateConstructorUsedError;
  Cliente? get selectedCliente => throw _privateConstructorUsedError;
  String? get formaPago => throw _privateConstructorUsedError;
  String? get usoCfdi => throw _privateConstructorUsedError;
  String get referenciaBancaria => throw _privateConstructorUsedError;
  String get tagId => throw _privateConstructorUsedError;
  bool get isValidatingTag => throw _privateConstructorUsedError;
  TagValidationResult? get tagValidationResult =>
      throw _privateConstructorUsedError;
  String get odoInicialStr => throw _privateConstructorUsedError;
  String get odoFinalStr => throw _privateConstructorUsedError;
  String get nipStr => throw _privateConstructorUsedError;
  bool get isBilling => throw _privateConstructorUsedError;
  FacturacionResponse? get billingResult => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillingWizardStateCopyWith<BillingWizardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingWizardStateCopyWith<$Res> {
  factory $BillingWizardStateCopyWith(
    BillingWizardState value,
    $Res Function(BillingWizardState) then,
  ) = _$BillingWizardStateCopyWithImpl<$Res, BillingWizardState>;
  @useResult
  $Res call({
    PaymentMode paymentMode,
    ContadoType contadoType,
    String rfcQuery,
    List<Cliente> searchedClientes,
    bool isSearchingClientes,
    Cliente? selectedCliente,
    String? formaPago,
    String? usoCfdi,
    String referenciaBancaria,
    String tagId,
    bool isValidatingTag,
    TagValidationResult? tagValidationResult,
    String odoInicialStr,
    String odoFinalStr,
    String nipStr,
    bool isBilling,
    FacturacionResponse? billingResult,
    String? errorMessage,
  });

  $ClienteCopyWith<$Res>? get selectedCliente;
  $TagValidationResultCopyWith<$Res>? get tagValidationResult;
  $FacturacionResponseCopyWith<$Res>? get billingResult;
}

/// @nodoc
class _$BillingWizardStateCopyWithImpl<$Res, $Val extends BillingWizardState>
    implements $BillingWizardStateCopyWith<$Res> {
  _$BillingWizardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMode = null,
    Object? contadoType = null,
    Object? rfcQuery = null,
    Object? searchedClientes = null,
    Object? isSearchingClientes = null,
    Object? selectedCliente = freezed,
    Object? formaPago = freezed,
    Object? usoCfdi = freezed,
    Object? referenciaBancaria = null,
    Object? tagId = null,
    Object? isValidatingTag = null,
    Object? tagValidationResult = freezed,
    Object? odoInicialStr = null,
    Object? odoFinalStr = null,
    Object? nipStr = null,
    Object? isBilling = null,
    Object? billingResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            paymentMode: null == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                      as PaymentMode,
            contadoType: null == contadoType
                ? _value.contadoType
                : contadoType // ignore: cast_nullable_to_non_nullable
                      as ContadoType,
            rfcQuery: null == rfcQuery
                ? _value.rfcQuery
                : rfcQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            searchedClientes: null == searchedClientes
                ? _value.searchedClientes
                : searchedClientes // ignore: cast_nullable_to_non_nullable
                      as List<Cliente>,
            isSearchingClientes: null == isSearchingClientes
                ? _value.isSearchingClientes
                : isSearchingClientes // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectedCliente: freezed == selectedCliente
                ? _value.selectedCliente
                : selectedCliente // ignore: cast_nullable_to_non_nullable
                      as Cliente?,
            formaPago: freezed == formaPago
                ? _value.formaPago
                : formaPago // ignore: cast_nullable_to_non_nullable
                      as String?,
            usoCfdi: freezed == usoCfdi
                ? _value.usoCfdi
                : usoCfdi // ignore: cast_nullable_to_non_nullable
                      as String?,
            referenciaBancaria: null == referenciaBancaria
                ? _value.referenciaBancaria
                : referenciaBancaria // ignore: cast_nullable_to_non_nullable
                      as String,
            tagId: null == tagId
                ? _value.tagId
                : tagId // ignore: cast_nullable_to_non_nullable
                      as String,
            isValidatingTag: null == isValidatingTag
                ? _value.isValidatingTag
                : isValidatingTag // ignore: cast_nullable_to_non_nullable
                      as bool,
            tagValidationResult: freezed == tagValidationResult
                ? _value.tagValidationResult
                : tagValidationResult // ignore: cast_nullable_to_non_nullable
                      as TagValidationResult?,
            odoInicialStr: null == odoInicialStr
                ? _value.odoInicialStr
                : odoInicialStr // ignore: cast_nullable_to_non_nullable
                      as String,
            odoFinalStr: null == odoFinalStr
                ? _value.odoFinalStr
                : odoFinalStr // ignore: cast_nullable_to_non_nullable
                      as String,
            nipStr: null == nipStr
                ? _value.nipStr
                : nipStr // ignore: cast_nullable_to_non_nullable
                      as String,
            isBilling: null == isBilling
                ? _value.isBilling
                : isBilling // ignore: cast_nullable_to_non_nullable
                      as bool,
            billingResult: freezed == billingResult
                ? _value.billingResult
                : billingResult // ignore: cast_nullable_to_non_nullable
                      as FacturacionResponse?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClienteCopyWith<$Res>? get selectedCliente {
    if (_value.selectedCliente == null) {
      return null;
    }

    return $ClienteCopyWith<$Res>(_value.selectedCliente!, (value) {
      return _then(_value.copyWith(selectedCliente: value) as $Val);
    });
  }

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagValidationResultCopyWith<$Res>? get tagValidationResult {
    if (_value.tagValidationResult == null) {
      return null;
    }

    return $TagValidationResultCopyWith<$Res>(_value.tagValidationResult!, (
      value,
    ) {
      return _then(_value.copyWith(tagValidationResult: value) as $Val);
    });
  }

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacturacionResponseCopyWith<$Res>? get billingResult {
    if (_value.billingResult == null) {
      return null;
    }

    return $FacturacionResponseCopyWith<$Res>(_value.billingResult!, (value) {
      return _then(_value.copyWith(billingResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillingWizardStateImplCopyWith<$Res>
    implements $BillingWizardStateCopyWith<$Res> {
  factory _$$BillingWizardStateImplCopyWith(
    _$BillingWizardStateImpl value,
    $Res Function(_$BillingWizardStateImpl) then,
  ) = __$$BillingWizardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PaymentMode paymentMode,
    ContadoType contadoType,
    String rfcQuery,
    List<Cliente> searchedClientes,
    bool isSearchingClientes,
    Cliente? selectedCliente,
    String? formaPago,
    String? usoCfdi,
    String referenciaBancaria,
    String tagId,
    bool isValidatingTag,
    TagValidationResult? tagValidationResult,
    String odoInicialStr,
    String odoFinalStr,
    String nipStr,
    bool isBilling,
    FacturacionResponse? billingResult,
    String? errorMessage,
  });

  @override
  $ClienteCopyWith<$Res>? get selectedCliente;
  @override
  $TagValidationResultCopyWith<$Res>? get tagValidationResult;
  @override
  $FacturacionResponseCopyWith<$Res>? get billingResult;
}

/// @nodoc
class __$$BillingWizardStateImplCopyWithImpl<$Res>
    extends _$BillingWizardStateCopyWithImpl<$Res, _$BillingWizardStateImpl>
    implements _$$BillingWizardStateImplCopyWith<$Res> {
  __$$BillingWizardStateImplCopyWithImpl(
    _$BillingWizardStateImpl _value,
    $Res Function(_$BillingWizardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMode = null,
    Object? contadoType = null,
    Object? rfcQuery = null,
    Object? searchedClientes = null,
    Object? isSearchingClientes = null,
    Object? selectedCliente = freezed,
    Object? formaPago = freezed,
    Object? usoCfdi = freezed,
    Object? referenciaBancaria = null,
    Object? tagId = null,
    Object? isValidatingTag = null,
    Object? tagValidationResult = freezed,
    Object? odoInicialStr = null,
    Object? odoFinalStr = null,
    Object? nipStr = null,
    Object? isBilling = null,
    Object? billingResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$BillingWizardStateImpl(
        paymentMode: null == paymentMode
            ? _value.paymentMode
            : paymentMode // ignore: cast_nullable_to_non_nullable
                  as PaymentMode,
        contadoType: null == contadoType
            ? _value.contadoType
            : contadoType // ignore: cast_nullable_to_non_nullable
                  as ContadoType,
        rfcQuery: null == rfcQuery
            ? _value.rfcQuery
            : rfcQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        searchedClientes: null == searchedClientes
            ? _value._searchedClientes
            : searchedClientes // ignore: cast_nullable_to_non_nullable
                  as List<Cliente>,
        isSearchingClientes: null == isSearchingClientes
            ? _value.isSearchingClientes
            : isSearchingClientes // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedCliente: freezed == selectedCliente
            ? _value.selectedCliente
            : selectedCliente // ignore: cast_nullable_to_non_nullable
                  as Cliente?,
        formaPago: freezed == formaPago
            ? _value.formaPago
            : formaPago // ignore: cast_nullable_to_non_nullable
                  as String?,
        usoCfdi: freezed == usoCfdi
            ? _value.usoCfdi
            : usoCfdi // ignore: cast_nullable_to_non_nullable
                  as String?,
        referenciaBancaria: null == referenciaBancaria
            ? _value.referenciaBancaria
            : referenciaBancaria // ignore: cast_nullable_to_non_nullable
                  as String,
        tagId: null == tagId
            ? _value.tagId
            : tagId // ignore: cast_nullable_to_non_nullable
                  as String,
        isValidatingTag: null == isValidatingTag
            ? _value.isValidatingTag
            : isValidatingTag // ignore: cast_nullable_to_non_nullable
                  as bool,
        tagValidationResult: freezed == tagValidationResult
            ? _value.tagValidationResult
            : tagValidationResult // ignore: cast_nullable_to_non_nullable
                  as TagValidationResult?,
        odoInicialStr: null == odoInicialStr
            ? _value.odoInicialStr
            : odoInicialStr // ignore: cast_nullable_to_non_nullable
                  as String,
        odoFinalStr: null == odoFinalStr
            ? _value.odoFinalStr
            : odoFinalStr // ignore: cast_nullable_to_non_nullable
                  as String,
        nipStr: null == nipStr
            ? _value.nipStr
            : nipStr // ignore: cast_nullable_to_non_nullable
                  as String,
        isBilling: null == isBilling
            ? _value.isBilling
            : isBilling // ignore: cast_nullable_to_non_nullable
                  as bool,
        billingResult: freezed == billingResult
            ? _value.billingResult
            : billingResult // ignore: cast_nullable_to_non_nullable
                  as FacturacionResponse?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BillingWizardStateImpl implements _BillingWizardState {
  const _$BillingWizardStateImpl({
    required this.paymentMode,
    required this.contadoType,
    required this.rfcQuery,
    required final List<Cliente> searchedClientes,
    required this.isSearchingClientes,
    required this.selectedCliente,
    required this.formaPago,
    required this.usoCfdi,
    required this.referenciaBancaria,
    required this.tagId,
    required this.isValidatingTag,
    required this.tagValidationResult,
    required this.odoInicialStr,
    required this.odoFinalStr,
    required this.nipStr,
    required this.isBilling,
    required this.billingResult,
    required this.errorMessage,
  }) : _searchedClientes = searchedClientes;

  @override
  final PaymentMode paymentMode;
  @override
  final ContadoType contadoType;
  @override
  final String rfcQuery;
  final List<Cliente> _searchedClientes;
  @override
  List<Cliente> get searchedClientes {
    if (_searchedClientes is EqualUnmodifiableListView)
      return _searchedClientes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedClientes);
  }

  @override
  final bool isSearchingClientes;
  @override
  final Cliente? selectedCliente;
  @override
  final String? formaPago;
  @override
  final String? usoCfdi;
  @override
  final String referenciaBancaria;
  @override
  final String tagId;
  @override
  final bool isValidatingTag;
  @override
  final TagValidationResult? tagValidationResult;
  @override
  final String odoInicialStr;
  @override
  final String odoFinalStr;
  @override
  final String nipStr;
  @override
  final bool isBilling;
  @override
  final FacturacionResponse? billingResult;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BillingWizardState(paymentMode: $paymentMode, contadoType: $contadoType, rfcQuery: $rfcQuery, searchedClientes: $searchedClientes, isSearchingClientes: $isSearchingClientes, selectedCliente: $selectedCliente, formaPago: $formaPago, usoCfdi: $usoCfdi, referenciaBancaria: $referenciaBancaria, tagId: $tagId, isValidatingTag: $isValidatingTag, tagValidationResult: $tagValidationResult, odoInicialStr: $odoInicialStr, odoFinalStr: $odoFinalStr, nipStr: $nipStr, isBilling: $isBilling, billingResult: $billingResult, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingWizardStateImpl &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.contadoType, contadoType) ||
                other.contadoType == contadoType) &&
            (identical(other.rfcQuery, rfcQuery) ||
                other.rfcQuery == rfcQuery) &&
            const DeepCollectionEquality().equals(
              other._searchedClientes,
              _searchedClientes,
            ) &&
            (identical(other.isSearchingClientes, isSearchingClientes) ||
                other.isSearchingClientes == isSearchingClientes) &&
            (identical(other.selectedCliente, selectedCliente) ||
                other.selectedCliente == selectedCliente) &&
            (identical(other.formaPago, formaPago) ||
                other.formaPago == formaPago) &&
            (identical(other.usoCfdi, usoCfdi) || other.usoCfdi == usoCfdi) &&
            (identical(other.referenciaBancaria, referenciaBancaria) ||
                other.referenciaBancaria == referenciaBancaria) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.isValidatingTag, isValidatingTag) ||
                other.isValidatingTag == isValidatingTag) &&
            (identical(other.tagValidationResult, tagValidationResult) ||
                other.tagValidationResult == tagValidationResult) &&
            (identical(other.odoInicialStr, odoInicialStr) ||
                other.odoInicialStr == odoInicialStr) &&
            (identical(other.odoFinalStr, odoFinalStr) ||
                other.odoFinalStr == odoFinalStr) &&
            (identical(other.nipStr, nipStr) || other.nipStr == nipStr) &&
            (identical(other.isBilling, isBilling) ||
                other.isBilling == isBilling) &&
            (identical(other.billingResult, billingResult) ||
                other.billingResult == billingResult) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    paymentMode,
    contadoType,
    rfcQuery,
    const DeepCollectionEquality().hash(_searchedClientes),
    isSearchingClientes,
    selectedCliente,
    formaPago,
    usoCfdi,
    referenciaBancaria,
    tagId,
    isValidatingTag,
    tagValidationResult,
    odoInicialStr,
    odoFinalStr,
    nipStr,
    isBilling,
    billingResult,
    errorMessage,
  );

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingWizardStateImplCopyWith<_$BillingWizardStateImpl> get copyWith =>
      __$$BillingWizardStateImplCopyWithImpl<_$BillingWizardStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BillingWizardState implements BillingWizardState {
  const factory _BillingWizardState({
    required final PaymentMode paymentMode,
    required final ContadoType contadoType,
    required final String rfcQuery,
    required final List<Cliente> searchedClientes,
    required final bool isSearchingClientes,
    required final Cliente? selectedCliente,
    required final String? formaPago,
    required final String? usoCfdi,
    required final String referenciaBancaria,
    required final String tagId,
    required final bool isValidatingTag,
    required final TagValidationResult? tagValidationResult,
    required final String odoInicialStr,
    required final String odoFinalStr,
    required final String nipStr,
    required final bool isBilling,
    required final FacturacionResponse? billingResult,
    required final String? errorMessage,
  }) = _$BillingWizardStateImpl;

  @override
  PaymentMode get paymentMode;
  @override
  ContadoType get contadoType;
  @override
  String get rfcQuery;
  @override
  List<Cliente> get searchedClientes;
  @override
  bool get isSearchingClientes;
  @override
  Cliente? get selectedCliente;
  @override
  String? get formaPago;
  @override
  String? get usoCfdi;
  @override
  String get referenciaBancaria;
  @override
  String get tagId;
  @override
  bool get isValidatingTag;
  @override
  TagValidationResult? get tagValidationResult;
  @override
  String get odoInicialStr;
  @override
  String get odoFinalStr;
  @override
  String get nipStr;
  @override
  bool get isBilling;
  @override
  FacturacionResponse? get billingResult;
  @override
  String? get errorMessage;

  /// Create a copy of BillingWizardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillingWizardStateImplCopyWith<_$BillingWizardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
