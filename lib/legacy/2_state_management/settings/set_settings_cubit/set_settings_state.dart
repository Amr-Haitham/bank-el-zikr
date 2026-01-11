part of 'set_settings_cubit.dart';

@immutable
sealed class SetSettingsState {}

final class SetSettingsInitial extends SetSettingsState {}
final class SetSettingsLoading extends SetSettingsState {}
final class SetSettingsLoaded extends SetSettingsState {}
final class SetSettingsError extends SetSettingsState {}
