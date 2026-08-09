import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/get_current_coordinates.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/schedule_adhkar_reminders.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/get_settings.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/update_settings.dart';
import 'package:flutter/material.dart';

class SettingsCubit extends RequestCubit<Settings> {
  final GetSettings getSettings;
  final UpdateSettings updateSettings;
  final ScheduleAdhkarReminders scheduleAdhkarReminders;
  final GetCurrentCoordinates getCurrentCoordinates;

  SettingsCubit({
    required this.getSettings,
    required this.updateSettings,
    required this.scheduleAdhkarReminders,
    required this.getCurrentCoordinates,
  }) : super(
          callOnCreate: true,
          request: () => getSettings(const NoParams()),
        );

  Future<void> setTheme(bool isLightTheme) async {
    final result = await updateSettings(
      UpdateSettingsParams(isLightTheme: isLightTheme),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setVibration(bool isVibrating) async {
    final result = await updateSettings(
      UpdateSettingsParams(isVibrating: isVibrating),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setMorningAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(morningZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
      },
    );
  }

  Future<void> setNightAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(nightZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
      },
    );
  }

  /// Turning reminders on requires location access (used to compute
  /// prayer times for Auto mode, and kept as a hard requirement even in
  /// Manual mode so switching modes later doesn't silently fail).
  /// Returns false — leaving the toggle off — if location isn't available.
  Future<bool> setAdhkarRemindersEnabled(bool value) async {
    if (value) {
      final coordinatesResult = await getCurrentCoordinates(const NoParams());
      if (coordinatesResult.isLeft()) {
        return false;
      }
    }

    final result = await updateSettings(
      UpdateSettingsParams(adhkarRemindersEnabled: value),
    );
    return result.fold(
      (failure) => false,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
        return true;
      },
    );
  }

  Future<void> setReminderMode(String mode) async {
    final result = await updateSettings(
      UpdateSettingsParams(reminderMode: mode),
    );
    result.fold(
      (failure) => null,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
      },
    );
  }

  Future<void> setMorningReminderEnabled(bool value) async {
    final result = await updateSettings(
      UpdateSettingsParams(morningReminderEnabled: value),
    );
    result.fold(
      (failure) => null,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
      },
    );
  }

  Future<void> setEveningReminderEnabled(bool value) async {
    final result = await updateSettings(
      UpdateSettingsParams(eveningReminderEnabled: value),
    );
    result.fold(
      (failure) => null,
      (_) {
        reExecutePastRequest();
        scheduleAdhkarReminders(const NoParams());
      },
    );
  }

  Future<void> completeOnboarding(String selectedLanguage) async {
    final result = await updateSettings(
      UpdateSettingsParams(
        selectedLanguage: selectedLanguage,
        hasSeenOnboarding: true,
      ),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setLanguage(String language) async {
    final result = await updateSettings(
      UpdateSettingsParams(selectedLanguage: language),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setDhikrFont(String font) async {
    final result = await updateSettings(
      UpdateSettingsParams(dhikrFont: font),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setTextSize(String size) async {
    final result = await updateSettings(
      UpdateSettingsParams(textSize: size),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setUseArabicNumerals(bool value) async {
    final result = await updateSettings(
      UpdateSettingsParams(useArabicNumerals: value),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }
}
