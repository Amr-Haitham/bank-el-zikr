import 'package:dartz/dartz.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/day_record.dart';
import '../repositories/day_record_repository.dart';

/// Use case for getting the last 7 days of records for the week view.
class GetWeekAzkarRecords implements UseCase<List<DayRecordEntity>, NoParams> {
  final DayRecordRepository repository;

  GetWeekAzkarRecords(this.repository);

  @override
  Future<RequestResult<List<DayRecordEntity>>> call(NoParams params) async {
    final result = await repository.getAll();
    return result.fold(
      (failure) => Left(failure),
      (records) => Right(records.take(7).toList()),
    );
  }
}
