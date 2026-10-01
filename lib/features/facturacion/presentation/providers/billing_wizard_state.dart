import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/cliente.dart';
import '../../data/models/tag_validation_result.dart';
import '../../data/models/facturacion_response.dart';
import 'package:facturacion_app/core/network/secure_storage_service.dart';
import 'billing_providers.dart';

part 'billing_wizard_state.freezed.dart';
part 'billing_wizard_state.g.dart';

enum PaymentMode { contado, credito }
enum ContadoType { publicoGeneral, clienteRfc }

@freezed
class BillingWizardState with _$BillingWizardState {
  const factory BillingWizardState({
    required PaymentMode paymentMode,
    required ContadoType contadoType,
    required String rfcQuery,
    required List<Cliente> searchedClientes,
    required bool isSearchingClientes,
    required Cliente? selectedCliente,
    required String tagId,
    required bool isValidatingTag,
    required TagValidationResult? tagValidationResult,
    required String odoInicialStr,
    required String odoFinalStr,
    required String nipStr,
    required bool isBilling,
    required FacturacionResponse? billingResult,
    required String? errorMessage,
  }) = _BillingWizardState;
}

@riverpod
class BillingWizard extends _$BillingWizard {
  @override
  BillingWizardState build() {
    return const BillingWizardState(
      paymentMode: PaymentMode.contado,
      contadoType: ContadoType.publicoGeneral,
      rfcQuery: '',
      searchedClientes: [],
      isSearchingClientes: false,
      selectedCliente: null,
      tagId: '',
      isValidatingTag: false,
      tagValidationResult: null,
      odoInicialStr: '',
      odoFinalStr: '',
      nipStr: '',
      isBilling: false,
      billingResult: null,
      errorMessage: null,
    );
  }

  void setPaymentMode(PaymentMode mode) {
    state = state.copyWith(paymentMode: mode, errorMessage: null);
  }

  void setContadoType(ContadoType type) {
    state = state.copyWith(contadoType: type, errorMessage: null);
  }

  void setRfcQuery(String query) {
    state = state.copyWith(rfcQuery: query);
  }

  void setOdoInicial(String value) {
    state = state.copyWith(odoInicialStr: value);
  }

  void setOdoFinal(String value) {
    state = state.copyWith(odoFinalStr: value);
  }

  void setNip(String value) {
    state = state.copyWith(nipStr: value);
  }

  void setTagId(String value) {
    state = state.copyWith(tagId: value, tagValidationResult: null);
  }

  Future<void> searchClientes() async {
    if (state.rfcQuery.trim().isEmpty) return;
    state = state.copyWith(isSearchingClientes: true, selectedCliente: null, errorMessage: null);
    try {
      final repo = ref.read(clienteRepositoryProvider);
      final list = await repo.searchClientes(state.rfcQuery);
      state = state.copyWith(searchedClientes: list, isSearchingClientes: false);
    } catch (e) {
      state = state.copyWith(isSearchingClientes: false, errorMessage: e.toString());
    }
  }

  void selectCliente(Cliente cliente) {
    state = state.copyWith(selectedCliente: cliente);
  }

  Future<bool> validateTag() async {
    if (state.tagId.trim().isEmpty) return false;
    state = state.copyWith(isValidatingTag: true, tagValidationResult: null, errorMessage: null);
    try {
      final repo = ref.read(tagRepositoryProvider);
      final result = await repo.validateTag(state.tagId);
            state = state.copyWith(
          tagValidationResult: result, 
          isValidatingTag: false,
          odoInicialStr: result.isValid ? '125400' : state.odoInicialStr,
      );
      return result.isValid;
    } catch (e) {
      state = state.copyWith(
        isValidatingTag: false,
        tagValidationResult: TagValidationResult(isValid: false, errorMessage: e.toString()),
      );
      return false;
    }
  }

  Future<bool> generateInvoice({required String despachoId, required String dispatcherId}) async {
    state = state.copyWith(isBilling: true, errorMessage: null, billingResult: null);
    try {
      final repo = ref.read(facturacionRepositoryProvider);
      
      final paymentType = state.paymentMode == PaymentMode.contado
          ? (state.contadoType == ContadoType.publicoGeneral ? 'Contado (Público General)' : 'Contado (Cliente RFC)')
          : 'Crédito (TAG)';

      final rfc = state.paymentMode == PaymentMode.contado && state.contadoType == ContadoType.clienteRfc
          ? state.selectedCliente?.rfc
          : null;

      final tagId = state.paymentMode == PaymentMode.credito ? state.tagId : null;
      final odoInicial = int.tryParse(state.odoInicialStr);
      final odoFinal = int.tryParse(state.odoFinalStr);

      final secureStorage = ref.read(secureStorageServiceProvider);
      final printerWidth = await secureStorage.readPrinterWidth();

      final response = await repo.generateInvoice(
        despachoId: despachoId,
        paymentType: paymentType,
        rfc: rfc,
        tagId: tagId,
        odoInicial: odoInicial,
        odoFinal: odoFinal,
        dispatcherId: dispatcherId,
        printerWidth: printerWidth,
      );

      state = state.copyWith(isBilling: false, billingResult: response);
      return true;
    } catch (e) {
      state = state.copyWith(isBilling: false, errorMessage: e.toString());
      return false;
    }
  }

  void reset() {
    state = const BillingWizardState(
      paymentMode: PaymentMode.contado,
      contadoType: ContadoType.publicoGeneral,
      rfcQuery: '',
      searchedClientes: [],
      isSearchingClientes: false,
      selectedCliente: null,
      tagId: '',
      isValidatingTag: false,
      tagValidationResult: null,
      odoInicialStr: '',
      odoFinalStr: '',
      nipStr: '',
      isBilling: false,
      billingResult: null,
      errorMessage: null,
    );
  }
}
