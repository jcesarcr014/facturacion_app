import 'isla_repository.dart';

class MockIslaRepository implements IslaRepository {
  @override
  Future<List<int>> getPositions() async {
    // Simulate 1 second network delay
    await Future.delayed(const Duration(seconds: 1));
    return [1, 2, 3, 4];
  }
}
