import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:facturacion_app/core/services/nfc_service.dart';
import 'package:facturacion_app/core/services/printer_service.dart';
import '../providers/billing_wizard_state.dart';
import 'widgets/custom_numpad.dart';

class BillingWizardView extends ConsumerStatefulWidget {
  final String despachoId;

  const BillingWizardView({super.key, required this.despachoId});

  @override
  ConsumerState<BillingWizardView> createState() => _BillingWizardViewState();
}

class _BillingWizardViewState extends ConsumerState<BillingWizardView> {
  final _rfcController = TextEditingController();
  final _tagController = TextEditingController();
  final _odoInicialController = TextEditingController();
  final _odoFinalController = TextEditingController();

  @override
  void dispose() {
    _rfcController.dispose();
    _tagController.dispose();
    _odoInicialController.dispose();
    _odoFinalController.dispose();
    super.dispose();
  }

  Future<void> _handleTagValidation(
    BillingWizardState state,
    BillingWizard notifier,
  ) async {
    final isValid = await notifier.validateTag();
    if (!mounted) return;

    if (!isValid) {
      // Show full-screen blocking red warning dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: false,
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xFF991B1B), // Dark Red
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.block_outlined,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      'TAG INVALIDO / SIN SALDO',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      state.tagValidationResult?.errorMessage ??
                          'El TAG ingresado no cuenta con autorización o saldo suficiente para completar esta operación.',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFEE2E2),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF991B1B),
                        minimumSize: const Size(260, 64),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Corregir TAG / Cancelar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _showMagneticBottomSheet(BillingWizardState state, BillingWizard notifier) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (builderContext, setModalState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.contactless_outlined,
                      color: Color(0xFF0D9488),
                      size: 64,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Autenticación del Despachador',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pase la tarjeta de banda magnética del despachador por el lector para autorizar.',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 15,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(builderContext); // Close bottomsheet

                        // 1. Trigger NFC simulated scan dialog (2 seconds)
                        final dispatcherUid = await ref
                            .read(nfcServiceProvider)
                            .readCard(context);
                        if (dispatcherUid == null || !mounted) return;

                        // 2. Trigger Invoicing generation loader (2 seconds)
                        final success = await notifier.generateInvoice(
                          despachoId: widget.despachoId,
                          dispatcherId: dispatcherUid,
                        );
                        if (!success || !mounted) return;

                        // 3. Trigger Printing simulated overlay (3 seconds)
                        final ticketText = ref
                            .read(billingWizardProvider)
                            .billingResult!
                            .ticketRawText;
                        await ref
                            .read(printerServiceProvider)
                            .printTicket(context, ticketText);
                        if (!mounted) return;

                        // 4. Trigger Full-screen green success dialog (2.5 seconds)
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          useSafeArea: false,
                          builder: (dialogContext) {
                            return Scaffold(
                              backgroundColor: const Color(
                                0xFF059669,
                              ), // Green 600
                              body: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 54,
                                        backgroundColor: Colors.white24,
                                        child: Icon(
                                          Icons.check_circle_outline,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      const Text(
                                        'Facturación Exitosa',
                                        style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 14),
                                      const Text(
                                        'Factura timbrada con éxito y ticket impreso de manera correcta.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFD1FAE5),
                                          height: 1.4,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                        await Future.delayed(
                          const Duration(milliseconds: 2500),
                        );
                        if (mounted && Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }

                        // 5. Reset and auto-navigate back to island pumps dashboard
                        notifier.reset();
                        if (mounted) {
                          context.go('/isla');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D9488),
                        minimumSize: const Size(double.infinity, 64),
                      ),
                        child: const Text('Continuar'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(billingWizardProvider);
    final notifier = ref.read(billingWizardProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facturar Despacho'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            notifier.reset();
            context.pop();
          },
        ),
        actions: [
          ref
              .watch(printerEnabledProvider)
              .when(
                data: (isEnabled) => IconButton(
                  icon: Icon(
                    isEnabled ? Icons.print : Icons.print_disabled,
                    color: isEnabled
                        ? const Color(0xFFD97706)
                        : const Color(0xFF64748B),
                  ),
                  tooltip: isEnabled
                      ? 'Impresora: Activada'
                      : 'Impresora: Desactivada',
                  onPressed: () {
                    ref.read(printerEnabledProvider.notifier).toggle();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              isEnabled
                                  ? Icons.print_disabled_outlined
                                  : Icons.print_outlined,
                              color: Colors.black87,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              isEnabled
                                  ? 'Impresora: DESACTIVADA (Modo Rápido)'
                                  : 'Impresora: ACTIVADA (3s de espera)',
                            ),
                          ],
                        ),
                        backgroundColor: isEnabled
                            ? const Color(0xFFE2E8F0)
                            : const Color(0xFF0D9488),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
                error: (_, __) => const SizedBox(),
                loading: () => const SizedBox(),
              ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Giant Payment Mode Selectors
                        _buildPaymentModeSelector(state, notifier),
                        const SizedBox(height: 24),

                        // Conditional payment tabs
                        if (state.paymentMode == PaymentMode.contado)
                          _buildContadoWizard(state, notifier)
                        else
                          _buildCreditoWizard(state, notifier),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

                // Proceed Button
                ElevatedButton(
                  onPressed: _isFormValid(state)
                      ? () => _showMagneticBottomSheet(state, notifier)
                      : null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: const Color(0xFFE2E8F0),
                    disabledForegroundColor: const Color(0xFF64748B),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline),
                      SizedBox(width: 12),
                      Text('Generar Factura'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state.isBilling)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text(
                      'Procesando firma y timbrado CFDI...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentModeSelector(
    BillingWizardState state,
    BillingWizard notifier,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildSelectorCard(
            title: 'CONTADO',
            icon: Icons.payments_outlined,
            isSelected: state.paymentMode == PaymentMode.contado,
            onTap: () {
              notifier.setPaymentMode(PaymentMode.contado);
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSelectorCard(
            title: 'CRÉDITO / TAG',
            icon: Icons.badge_outlined,
            isSelected: state.paymentMode == PaymentMode.credito,
            onTap: () {
              notifier.setPaymentMode(PaymentMode.credito);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSelectorCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0D9488) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFE2E8F0),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.black87),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContadoWizard(BillingWizardState state, BillingWizard notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        Row(
          children: [
            ChoiceChip(
              label: const Text('PÚBLICO GENERAL'),
              selected: state.contadoType == ContadoType.publicoGeneral,
              onSelected: (selected) {
                if (selected)
                  notifier.setContadoType(ContadoType.publicoGeneral);
              },
            ),
            const SizedBox(width: 12),
            ChoiceChip(
              label: const Text('CLIENTE RFC'),
              selected: state.contadoType == ContadoType.clienteRfc,
              onSelected: (selected) {
                if (selected) notifier.setContadoType(ContadoType.clienteRfc);
              },
            ),
          ],
        ),
        const SizedBox(height: 18),

        if (state.contadoType == ContadoType.clienteRfc) ...[
          // RFC search inputs
          TextField(
            controller: _rfcController,
            onChanged: notifier.setRfcQuery,
            decoration: const InputDecoration(
              labelText: 'Buscar RFC o Razón Social',
              hintText: 'ej. CSF150...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: state.rfcQuery.isNotEmpty
                ? () => notifier.searchClientes()
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                SizedBox(width: 8),
                Text('Buscar'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          if (state.isSearchingClientes)
            const Center(child: CircularProgressIndicator())
          else if (state.searchedClientes.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.searchedClientes.length,
              itemBuilder: (context, index) {
                final client = state.searchedClientes[index];
                final isSelected = state.selectedCliente?.rfc == client.rfc;

                return Card(
                  color: isSelected
                      ? const Color(0xFF0D9488).withOpacity(0.15)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected
                          ? const Color(0xFF0D9488)
                          : const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      client.razonSocial,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('RFC: ${client.rfc}'),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: Color(0xFF0D9488),
                          )
                        : null,
                    onTap: () => notifier.selectCliente(client),
                  ),
                );
              },
            ),

          if (state.selectedCliente != null) ...[
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF065F46).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF059669)),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Color(0xFF10B981)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedCliente!.razonSocial,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'RFC asignado: ${state.selectedCliente!.rfc}',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ] else
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text(
                      'Se emitirá un comprobante fiscal simplificado a la clave genérica de Público en General (XAXX010101000).',
                      style: TextStyle(fontSize: 15, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCreditoWizard(BillingWizardState state, BillingWizard notifier) {
    final isValid = state.tagValidationResult?.isValid ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const AlertDialog(
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text('Acerque TAG a la parte posterior...'),
                          ),
                        ],
                      ),
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  if (mounted && Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  notifier.setTagId('123');

                  // Let state update before validating
                  await Future.delayed(const Duration(milliseconds: 100));
                  final isValid = await notifier.validateTag();
                  if (mounted && !isValid) {
                    // The _handleTagValidation does the dialog natively, so we just use that directly
                    _handleTagValidation(
                      ref.read(billingWizardProvider),
                      notifier,
                    );
                  }
                },
                icon: const Icon(Icons.contactless_outlined, size: 28),
                label: const Text(
                  'Leer TAG',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0D9488),
                  side: const BorderSide(color: Color(0xFF0D9488), width: 2),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        if (state.tagValidationResult != null && isValid) ...[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF065F46).withOpacity(0.2), // Green 800
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF059669), width: 1.5),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle, color: Color(0xFF10B981)),
                    const SizedBox(width: 10),
                    const Text(
                      'TAG AUTORIZADO CON EXITO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, color: Color(0xFF059669)),
                _buildTagInfoRow(
                  'Cliente:',
                  state.tagValidationResult!.clientName ?? '-',
                ),
                const SizedBox(height: 6),
                _buildTagInfoRow(
                  'Placas:',
                  state.tagValidationResult!.plates ?? '-',
                ),
                const SizedBox(height: 6),
                _buildTagInfoRow(
                  'Saldo Disp.:',
                  '\$${state.tagValidationResult!.balance?.toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              TextField(
                controller: TextEditingController(text: state.odoInicialStr),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Odo. Inicial (KM)',
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _odoFinalController,
                onChanged: notifier.setOdoFinal,
                decoration: InputDecoration(
                  labelText: 'Odo. Final (KM)',
                  hintText: 'Ej. 120500',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: notifier.setNip,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'NIP de Autorización',
              hintText: 'Ingresa NIP (ej. 1848)',
              prefixIcon: const Icon(Icons.password),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ],
    );
  }

  Widget _buildTagInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  bool _isFormValid(BillingWizardState state) {
    if (state.paymentMode == PaymentMode.contado) {
      if (state.contadoType == ContadoType.clienteRfc &&
          state.selectedCliente == null) {
        return false;
      }
    } else {
      if (state.tagValidationResult == null ||
          !state.tagValidationResult!.isValid)
        return false;
      if (state.odoInicialStr.isEmpty || state.odoFinalStr.isEmpty)
        return false;
      if (state.nipStr != '1848') return false; // DUMMY validation
    }
    return !state.isBilling;
  }
}
