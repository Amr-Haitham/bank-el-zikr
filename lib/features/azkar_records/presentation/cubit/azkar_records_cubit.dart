import '../../../../core/presentation/request_cubit/request_cubit.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/day_zikr_record.dart';
import '../../domain/usecases/fix_and_increment_record.dart';
import '../../domain/usecases/get_week_azkar_records.dart';

/// Cubit for managing azkar records using RequestCubit pattern with Freezed
/// Replaces the old SetAzkarRecordsCubit and GetWeekAzkarRecordCubit
///
/// This cubit manages the 7-day sliding window of zikr records and handles
/// incrementing counts for individual azkar
class AzkarRecordsCubit extends RequestCubit<List<DayZikrRecord>> {
  final GetWeekAzkarRecords getWeekAzkarRecords;
  final FixAndIncrementRecord fixAndIncrementRecord;

  AzkarRecordsCubit({
    required this.getWeekAzkarRecords,
    required this.fixAndIncrementRecord,
  }) : super(
          callOnCreate: false, // Don't auto-load on creation
          request: () => getWeekAzkarRecords(const NoParams()),
        );

  /// Load the azkar records (can also call execute() directly)
  Future<void> loadRecords() async {
    await execute(request: () => getWeekAzkarRecords(const NoParams()));
  }

  /// Fix records to maintain 7-day window and optionally increment a zikr's count
  /// After fixing/incrementing, reload the records to show updated data
  ///
  /// [zikrId] - The ID of the zikr to increment. If null, just fix records without incrementing
  Future<void> fixAndIncrementRecordById(int? zikrId) async {
    final result = await fixAndIncrementRecord(
      FixAndIncrementRecordParams(zikrId: zikrId),
    );

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful fix/increment
    );
  }

  /// Delete all records for a specific zikr
  Future<void> deleteZikrRecordById(int zikrId) async {
    final result =
        await getWeekAzkarRecords.repository.deleteZikrRecord(zikrId);

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful deletion
    );
  }
}
