part of 'get_general_data_cubit.dart';

@immutable
sealed class GetGeneralDataState {}

final class GetGeneralDataInitial extends GetGeneralDataState {}

final class GetGeneralDataLoading extends GetGeneralDataState {}

final class GetGeneralDataLoaded extends GetGeneralDataState {
  final GeneralData generalData;

  GetGeneralDataLoaded({required this.generalData});
}

final class GetGeneralDataError extends GetGeneralDataState {}
