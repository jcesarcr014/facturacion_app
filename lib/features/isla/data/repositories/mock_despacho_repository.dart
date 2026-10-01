import '../models/despacho.dart';
import 'despacho_repository.dart';

class MockDespachoRepository implements DespachoRepository {
  @override
  Future<List<Despacho>> getDespachosByPosition(int positionId) async {
    // Simulate 800ms of network delay
    await Future.delayed(const Duration(milliseconds: 800));

    final baseTime = DateTime.now();

    // Generates a mock list of sales for the specific position
    return [
      Despacho(
        id: 'TX-P$positionId-9004',
        positionId: positionId,
        product: ProductType.magna,
        liters: 32.45,
        amount: 726.88,
        pricePerLiter: 22.40,
        timestamp: baseTime.subtract(const Duration(minutes: 4)),
        isInvoiced: false,
      ),
      Despacho(
        id: 'TX-P$positionId-9003',
        positionId: positionId,
        product: ProductType.premium,
        liters: 45.10,
        amount: 1118.48,
        pricePerLiter: 24.80,
        timestamp: baseTime.subtract(const Duration(minutes: 15)),
        isInvoiced: false,
      ),
      Despacho(
        id: 'TX-P$positionId-9002',
        positionId: positionId,
        product: ProductType.diesel,
        liters: 120.00,
        amount: 2832.00,
        pricePerLiter: 23.60,
        timestamp: baseTime.subtract(const Duration(minutes: 32)),
        isInvoiced: true,
      ),
      Despacho(
        id: 'TX-P$positionId-9001',
        positionId: positionId,
        product: ProductType.magna,
        liters: 15.50,
        amount: 347.20,
        pricePerLiter: 22.40,
        timestamp: baseTime.subtract(const Duration(minutes: 55)),
        isInvoiced: false,
      ),
      Despacho(
        id: 'TX-P$positionId-8998',
        positionId: positionId,
        product: ProductType.premium,
        liters: 55.00,
        amount: 1364.00,
        pricePerLiter: 24.80,
        timestamp: baseTime.subtract(const Duration(hours: 1, minutes: 10)),
        isInvoiced: false,
      ),
      Despacho(
        id: 'TX-P$positionId-8995',
        positionId: positionId,
        product: ProductType.diesel,
        liters: 85.30,
        amount: 2013.08,
        pricePerLiter: 23.60,
        timestamp: baseTime.subtract(const Duration(hours: 2, minutes: 5)),
        isInvoiced: false,
      ),
    ];
  }
}
