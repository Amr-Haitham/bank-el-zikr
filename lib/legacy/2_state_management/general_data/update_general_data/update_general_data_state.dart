part of 'update_general_data_cubit.dart';

@immutable
sealed class UpdateGeneralDataState {}

final class UpdateGeneralDataInitial extends UpdateGeneralDataState {}
final class UpdateGeneralDataLoading extends UpdateGeneralDataState {}
final class UpdateGeneralDataUpdated extends UpdateGeneralDataState {}
final class UpdateGeneralDataError extends UpdateGeneralDataState {}
