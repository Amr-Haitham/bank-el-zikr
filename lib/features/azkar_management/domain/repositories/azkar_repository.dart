import '../../../../core/constants/type_definitions.dart';
import '../entities/zikr.dart';

abstract class AzkarRepository {
  /// Get all azkar (both default and custom)
  Future<RequestResult<List<Zikr>>> getAllAzkar();

  /// Add a new custom zikr
  Future<RequestResult<void>> addCustomZikr(Zikr zikr);

  /// Update an existing custom zikr
  Future<RequestResult<void>> updateCustomZikr(Zikr zikr);

  /// Delete a custom zikr by ID
  Future<RequestResult<void>> deleteCustomZikr(int id);
}
