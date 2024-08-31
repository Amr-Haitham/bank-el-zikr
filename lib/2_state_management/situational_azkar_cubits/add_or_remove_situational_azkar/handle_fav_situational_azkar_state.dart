part of 'handle_fav_situational_azkar_cubit.dart';

@immutable
sealed class HandleFavSituationalAzkarState {}

final class HandleFavSituationalAzkarInitial
    extends HandleFavSituationalAzkarState {}

final class HandleFavSituationalAzkarLoading
    extends HandleFavSituationalAzkarState {}

final class HandleFavSituationalAzkarLoaded
    extends HandleFavSituationalAzkarState {
  final List<String> ids;

  HandleFavSituationalAzkarLoaded({required this.ids});
}

final class HandleFavSituationalAzkarError
    extends HandleFavSituationalAzkarState {}
