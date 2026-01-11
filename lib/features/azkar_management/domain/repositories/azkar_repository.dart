import '../../../../core/constants/type_definitions.dart';
import '../entities/zikr.dart';

abstract class AzkarRepository {
  /// Get all azkar
  Future<RequestResult<List<ZikrEntity>>> getAllAzkar();

  /// Add a custom zikr
  Future<RequestResult<void>> addCustomZikr(ZikrEntity zikr);

  /// Update a custom zikr
  Future<RequestResult<void>> updateCustomZikr(ZikrEntity zikr);

  /// Delete a custom zikr by ID
  Future<RequestResult<void>> deleteCustomZikr(int id);
}
