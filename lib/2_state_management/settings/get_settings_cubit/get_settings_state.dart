part of 'get_settings_cubit.dart';

@immutable
sealed class GetSettingsState {}

final class GetSettingsInitial extends GetSettingsState {}

final class GetSettingsLoading extends GetSettingsState {}

final class GetSettingsLoaded extends GetSettingsState {
  final bool isLightTheme;
  final TimeOfDay? morningZikrAlarm;
  final TimeOfDay? nightZikrAlarm;

  GetSettingsLoaded({required this.isLightTheme, required this.morningZikrAlarm, required this.nightZikrAlarm});
}

final class GetSettingsError extends GetSettingsState {}
