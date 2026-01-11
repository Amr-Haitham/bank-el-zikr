part of 'delete_single_zikr_record_cubit.dart';

@immutable
sealed class DeleteSingleZikrRecordState {}

final class DeleteSingleZikrRecordInitial extends DeleteSingleZikrRecordState {}

final class DeleteSingleZikrRecordLoading extends DeleteSingleZikrRecordState {}

final class DeleteSingleZikrRecordLoaded extends DeleteSingleZikrRecordState {}

final class DeleteSingleZikrRecordError extends DeleteSingleZikrRecordState {}
