import 'dart:collection';
import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/day_zikr_record.dart';
import '../repositories/azkar_records_repository.dart';
import 'package:bank_el_ziker/core/constants/general_functions.dart';

/// Business logic use case for fixing records to maintain 7-day window
/// and optionally incrementing a specific zikr's count
class FixAndIncrementRecord
    implements UseCase<void, FixAndIncrementRecordParams> {
  final AzkarRecordsRepository repository;

  FixAndIncrementRecord(this.repository);

  @override
  Future<RequestResult<void>> call(FixAndIncrementRecordParams params) async {
    return safeAwait(() async {
      // Get current records
      final recordsResult = await repository.getAllRecords();

      return await recordsResult.fold(
        (failure) async => throw failure,
        (records) async {
          // Fix records to maintain 7-day sliding window
          final fixedRecords =
              _fixRecords(Queue<DayZikrRecordEntity>.from(records));

          // Update storage with fixed records
          await repository.updateAllRecords(fixedRecords);

          // If a zikr ID was provided, increment its count for today
          if (params.zikrId != null) {
            await repository.incrementZikrRecord(params.zikrId!);
          }
        },
      );
    });
  }

  /// Business logic: Maintain 7-day sliding window
  /// Ensures we always have records for the last 7 days
  List<DayZikrRecordEntity> _fixRecords(
      Queue<DayZikrRecordEntity> dayZikrRecords) {
    if (dayZikrRecords.isEmpty) return [];

    DateTime dateTimeNow = DateTime.now();
    DateTime dateTimeNowStartFrom12am =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);

    // Calculate how many days since last update
    int difference = dateTimeNowStartFrom12am
        .difference(dayZikrRecords.first.dateTime)
        .inDays;

    // Add new days and remove old ones to maintain 7-day window
    while (difference > 0) {
      dayZikrRecords.removeLast();
      var dateTime = dayZikrRecords.first.dateTime.add(const Duration(days: 1));

      dayZikrRecords.addFirst(DayZikrRecordEntity(
        id: dateIdGenerator(dateTime),
        dateTime: dateTime,
        azkarRecordById: const {},
      ));

      difference--;
    }

    return dayZikrRecords.toList();
  }
}

class FixAndIncrementRecordParams {
  final int? zikrId; // If null, just fix records without incrementing

  FixAndIncrementRecordParams({this.zikrId});
}
