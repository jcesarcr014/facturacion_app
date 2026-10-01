import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/views/setup_view.dart';
import '../../features/auth/presentation/views/wait_auth_view.dart';
import 'package:facturacion_app/features/isla/presentation/views/island_dashboard.dart';
import 'package:facturacion_app/features/isla/presentation/views/pump_sales_view.dart';
import 'package:facturacion_app/features/facturacion/presentation/views/billing_wizard_view.dart';
import 'package:facturacion_app/features/isla/presentation/views/settings_view.dart';
import 'package:facturacion_app/features/isla/presentation/views/printer_settings_view.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/setup',
    routes: [
      GoRoute(
        path: '/setup',
        builder: (context, state) => const SetupView(),
      ),
      GoRoute(
        path: '/wait-auth',
        builder: (context, state) => const WaitAuthView(),
      ),
      GoRoute(
        path: '/isla',
        builder: (context, state) => const IslandDashboard(),
      ),
      GoRoute(
        path: '/isla/posicion/:id',
        builder: (context, state) {
          final idStr = state.pathParameters['id'];
          final id = int.tryParse(idStr ?? '') ?? 1;
          return PumpSalesView(positionId: id);
        },
      ),
      GoRoute(
        path: '/facturacion/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return BillingWizardView(despachoId: id);
        },
      ),
      GoRoute(
        path: '/configuracion',
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/configuracion/impresora',
        builder: (context, state) => const PrinterSettingsView(),
      ),
    ],
    redirect: (context, state) {
      final subLocation = state.uri.path;

      return authState.maybeMap(
        initial: (_) => null, // Wait until initialization finishes
        unconfigured: (_) => subLocation == '/setup' ? null : '/setup',
        registering: (_) => subLocation == '/setup' ? null : '/setup',
        unauthorized: (_) => subLocation == '/wait-auth' ? null : '/wait-auth',
        authorized: (_) => (subLocation == '/setup' || subLocation == '/wait-auth') ? '/isla' : null,
        orElse: () => null,
      );
    },
  );
}
