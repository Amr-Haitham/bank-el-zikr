import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_week_azkar_records.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';

/// Cubit for managing azkar records across a week
class AzkarRecordsCubit extends RequestCubit<WeekAzkarRecord> {
  final GetWeekAzkarRecords getWeekAzkarRecords;
  final FixAndIncrementRecord fixAndIncrementRecord;

  AzkarRecordsCubit({
    required this.getWeekAzkarRecords,
    required this.fixAndIncrementRecord,
  }) : super(
          callOnCreate: false, // Don't auto-load on creation
          request: () async {
            final result = await getWeekAzkarRecords(const NoParams());
            return result.map((list) => WeekAzkarRecord.fromDailyRecords(list));
          },
        );

  /// Load the azkar records
  Future<void> loadRecords() async {
    await execute(
      request: () async {
        final result = await getWeekAzkarRecords(const NoParams());
        return result.map((list) => WeekAzkarRecord.fromDailyRecords(list));
      },
    );
  }

  /// Fix records to maintain 7-day window and optionally increment a zikr's count
  Future<void> fixAndIncrementRecordById(int? zikrId) async {
    final result = await fixAndIncrementRecord(
      FixAndIncrementRecordParams(zikrId: zikrId),
    );

    result.fold(
      (failure) => null,
      (_) => loadRecords(), // Reload after successful fix/increment
    );
  }

  /// Delete all records for a specific zikr
  Future<void> deleteZikrRecordById(int zikrId) async {
    final result =
        await getWeekAzkarRecords.repository.deleteZikrRecord(zikrId);

    result.fold(
      (failure) => null,
      (_) => loadRecords(), // Reload after successful deletion
    );
  }
}
