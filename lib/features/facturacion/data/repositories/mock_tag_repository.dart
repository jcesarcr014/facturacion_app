import '../models/tag_validation_result.dart';
import 'tag_repository.dart';

class MockTagRepository implements TagRepository {
  @override
  Future<TagValidationResult> validateTag(String tagId) async {
    // Simulate 800ms validation delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (tagId.trim() == '123') {
      return const TagValidationResult(
        isValid: true,
        balance: 4500.00,
        clientName: 'TRANSPORTES LOGÍSTICOS DEL NORTE',
        plates: 'FLD-982-A',
      );
    } else {
      return const TagValidationResult(
        isValid: false,
        errorMessage: 'El TAG ingresado no se encuentra activo o no cuenta con saldo disponible.',
      );
    }
  }
}
