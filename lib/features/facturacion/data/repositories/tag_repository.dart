import '../models/tag_validation_result.dart';

abstract class TagRepository {
  Future<TagValidationResult> validateTag(String tagId);
}
