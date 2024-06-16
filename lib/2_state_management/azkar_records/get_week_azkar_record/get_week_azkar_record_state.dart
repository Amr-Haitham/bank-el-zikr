part of 'get_week_azkar_record_cubit.dart';

@immutable
sealed class GetWeekAzkarRecordState {}

final class GetWeekAzkarRecordInitial extends GetWeekAzkarRecordState {}

final class GetWeekAzkarRecordLoading extends GetWeekAzkarRecordState {}

final class GetWeekAzkarRecordLoaded extends GetWeekAzkarRecordState {
  final Map<int, int> allWeekAzkarRecordsById;
  final Map<int, int> firstDayAzkarRecord;
  final List<DayZikrRecord> allWeekRecord;
  GetWeekAzkarRecordLoaded({required this.allWeekAzkarRecordsById,required this.firstDayAzkarRecord,required this.allWeekRecord});
}

final class GetWeekAzkarRecordError extends GetWeekAzkarRecordState {}
