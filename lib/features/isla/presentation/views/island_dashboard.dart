import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/island_provider.dart';

class IslandDashboard extends ConsumerWidget {
  const IslandDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionsAsync = ref.watch(islandPositionsProvider);
    final authState = ref.watch(authProvider);

    final deviceName = authState.maybeMap(
      authorized: (s) => s.islandConfig.name,
      orElse: () => 'Terminal de Pista',
    );

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(deviceName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Configuración de Impresión',
            onPressed: () => context.push('/configuracion'),
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Desvincular Terminal',
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: positionsAsync.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Cargando posiciones de la isla...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
               SizedBox(height: 16),
                Text(
                  'Error al cargar posiciones: $err',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.refresh(islandPositionsProvider),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (positions) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isTablet ? 1.4 : 1.6,
              ),
              itemCount: positions.length,
              itemBuilder: (context, index) {
                final pos = positions[index];
                return _buildPumpCard(context, pos);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildPumpCard(BuildContext context, int positionId) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => context.push('/isla/posicion/$positionId'),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'BOMBA',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.local_gas_station_outlined,
                    size: 42,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posición $positionId',
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Ver despachos y facturar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
