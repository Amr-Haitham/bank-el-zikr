import 'dart:collection';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_definitions.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/day_zikr_record.dart';
import '../repositories/azkar_records_repository.dart';

/// Business logic use case for fixing records to maintain 7-day window
/// and optionally incrementing a specific zikr's count
///
/// This extracts the _fixRecords business logic from the old cubit
class FixAndIncrementRecord implements UseCase<void, FixAndIncrementRecordParams> {
  final AzkarRecordsRepository repository;

  FixAndIncrementRecord(this.repository);

  @override
  Future<RequestResult<void>> call(FixAndIncrementRecordParams params) async {
    // Get current records
    final recordsResult = await repository.getAllRecords();

    return recordsResult.fold(
      (failure) async => Left(failure),
      (records) async {
        // Fix records to maintain 7-day sliding window
        final fixedRecords = _fixRecords(Queue<DayZikrRecord>.from(records));

        // Update storage with fixed records
        await repository.updateAllRecords(fixedRecords);

        // If a zikr ID was provided, increment its count for today
        if (params.zikrId != null) {
          await repository.incrementZikrRecord(params.zikrId!);
        }

        return const Right(null);
      },
    );
  }

  /// Business logic: Maintain 7-day sliding window
  /// Ensures we always have records for the last 7 days
  List<DayZikrRecord> _fixRecords(Queue<DayZikrRecord> dayZikrRecords) {
    DateTime dateTimeNow = DateTime.now();
    DateTime dateTimeNowStartFrom12am =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);

    // Calculate how many days since last update
    int difference =
        dateTimeNowStartFrom12am.difference(dayZikrRecords.first.dateTime).inDays;

    // Add new days and remove old ones to maintain 7-day window
    while (difference > 0) {
      dayZikrRecords.removeLast();
      var dateTime = dayZikrRecords.first.dateTime.add(const Duration(days: 1));
      dayZikrRecords.addFirst(DayZikrRecord(
        id: _generateDateId(dateTime),
        dateTime: dateTime,
        azkarRecordById: {},
      ));

      difference--;
    }

    return dayZikrRecords.toList();
  }

  /// Generate a unique ID based on date
  String _generateDateId(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }
}

class FixAndIncrementRecordParams {
  final int? zikrId; // If null, just fix records without incrementing

  FixAndIncrementRecordParams({this.zikrId});
}
