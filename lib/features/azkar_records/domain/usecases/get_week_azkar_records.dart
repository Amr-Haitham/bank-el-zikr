import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/day_zikr_record.dart';
import '../repositories/azkar_records_repository.dart';

/// Use case for getting all azkar records (7-day window)
class GetWeekAzkarRecords implements UseCase<List<DayZikrRecordEntity>, NoParams> {
  final AzkarRecordsRepository repository;

  GetWeekAzkarRecords(this.repository);

  @override
  Future<RequestResult<List<DayZikrRecordEntity>>> call(NoParams params) async {
    return await repository.getAllRecords();
  }
}
