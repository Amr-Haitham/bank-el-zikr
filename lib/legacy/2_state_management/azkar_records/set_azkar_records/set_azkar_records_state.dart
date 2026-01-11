part of 'set_azkar_records_cubit.dart';

@immutable
sealed class SetAzkarRecordsState {}

final class SetAzkarRecordsInitial extends SetAzkarRecordsState {}

final class SetAzkarRecordsLoading extends SetAzkarRecordsState {}

final class SetAzkarRecordsLoaded extends SetAzkarRecordsState {}

final class SetAzkarRecordsError extends SetAzkarRecordsState {}
