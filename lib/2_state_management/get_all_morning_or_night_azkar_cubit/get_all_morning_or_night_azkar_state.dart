part of 'get_all_morning_or_night_azkar_cubit.dart';

@immutable
sealed class GetAllMorningOrNightAzkarState {}

final class GetAllMorningOrNightAzkarInitial
    extends GetAllMorningOrNightAzkarState {}

final class GetAllMorningOrNightAzkarLoading
    extends GetAllMorningOrNightAzkarState {}

final class GetAllMorningOrNightAzkarLoaded
    extends GetAllMorningOrNightAzkarState {
  final List<MorningOrNightZikr> morningOrNightZikr;

  GetAllMorningOrNightAzkarLoaded({required this.morningOrNightZikr});
}

final class GetAllMorningOrNightAzkarError
    extends GetAllMorningOrNightAzkarState {}
