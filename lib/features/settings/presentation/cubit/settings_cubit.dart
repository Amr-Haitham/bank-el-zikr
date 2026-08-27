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
        ) {
    _verifyRemindersOnLaunch();
  }

  /// On launch, if reminders were left on from a previous session, re-runs
  /// scheduling once so a permission revoked outside the app (e.g. via OS
  /// Settings while the app was closed) is caught immediately rather than
  /// only the next time the user touches a reminder-related setting.
  Future<void> _verifyRemindersOnLaunch() async {
    await stream.firstWhere(
      (state) => state is RequestStateSuccess<Settings> ||
          state is RequestStateFailure<Settings>,
    );
    final settings = state.whenOrNull(success: (s) => s);
    if (settings != null && settings.adhkarRemindersEnabled) {
      await _rescheduleReminders();
    }
  }

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

  /// Runs [scheduleAdhkarReminders] and, if it fails, corrects
  /// `adhkarRemindersEnabled` back to false so the Settings toggle never
  /// claims reminders are on when scheduling actually failed (e.g. location
  /// permission was revoked after reminders had already been turned on).
  Future<void> _rescheduleReminders() async {
    final result = await scheduleAdhkarReminders(const NoParams());
    if (result.isLeft()) {
      await updateSettings(
        const UpdateSettingsParams(adhkarRemindersEnabled: false),
      );
    }
    reExecutePastRequest();
  }

  Future<void> setMorningAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(morningZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) => _rescheduleReminders(),
    );
  }

  Future<void> setNightAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(nightZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) => _rescheduleReminders(),
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
      (_) async {
        await _rescheduleReminders();
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
      (_) => _rescheduleReminders(),
    );
  }

  Future<void> setMorningReminderEnabled(bool value) async {
    final result = await updateSettings(
      UpdateSettingsParams(morningReminderEnabled: value),
    );
    result.fold(
      (failure) => null,
      (_) => _rescheduleReminders(),
    );
  }

  Future<void> setEveningReminderEnabled(bool value) async {
    final result = await updateSettings(
      UpdateSettingsParams(eveningReminderEnabled: value),
    );
    result.fold(
      (failure) => null,
      (_) => _rescheduleReminders(),
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

  /// Orchestrates the final step of onboarding: optionally attempts to turn
  /// on Adhkar reminders, then always marks onboarding complete. Returns
  /// false if [enableNotifications] was requested but failed (e.g. location
  /// permission denied) — true otherwise (including when notifications
  /// weren't requested at all).
  Future<bool> completeOnboardingWithNotifications(
    String selectedLanguage, {
    required bool enableNotifications,
  }) async {
    final notificationsSucceeded = enableNotifications
        ? await setAdhkarRemindersEnabled(true)
        : true;
    await completeOnboarding(selectedLanguage);
    return notificationsSucceeded;
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
