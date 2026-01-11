part of 'get_conditional_azkar_cubit.dart';

@immutable
sealed class GetConditionalAzkarState {}

final class GetConditionalAzkarInitial extends GetConditionalAzkarState {}

final class GetConditionalAzkarLoading extends GetConditionalAzkarState {}

final class GetConditionalAzkarLoaded extends GetConditionalAzkarState {
  final List<Zikr> conditionalAzkar;

  GetConditionalAzkarLoaded({required this.conditionalAzkar});
}

final class GetConditionalAzkarError extends GetConditionalAzkarState {}
