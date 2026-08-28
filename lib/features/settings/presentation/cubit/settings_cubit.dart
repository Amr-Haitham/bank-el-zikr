import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/get_current_coordinates.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/open_location_settings.dart';
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
  final OpenLocationSettings openLocationSettings;

  SettingsCubit({
    required this.getSettings,
    required this.updateSettings,
    required this.scheduleAdhkarReminders,
    required this.getCurrentCoordinates,
    required this.openLocationSettings,
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
      (state) =>
          state is RequestStateSuccess<Settings> ||
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
  /// Returns the failure that blocked it — leaving the toggle off — or null
  /// on success.
  Future<FailureBase?> setAdhkarRemindersEnabled(bool value) async {
    if (value) {
      final coordinatesResult = await getCurrentCoordinates(const NoParams());
      if (coordinatesResult.isLeft()) {
        return coordinatesResult.fold((failure) => failure, (_) => null);
      }
    }

    final result = await updateSettings(
      UpdateSettingsParams(adhkarRemindersEnabled: value),
    );
    return result.fold(
      (failure) => Future.value(failure),
      (_) async {
        await _rescheduleReminders();
        return null;
      },
    );
  }

  Future<void> openLocationSettingsScreen() => openLocationSettings();

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
  /// the failure that blocked [enableNotifications] (e.g. location services
  /// off, permission denied) — null if it succeeded or wasn't requested.
  Future<FailureBase?> completeOnboardingWithNotifications(
    String selectedLanguage, {
    required bool enableNotifications,
  }) async {
    final failure =
        enableNotifications ? await setAdhkarRemindersEnabled(true) : null;
    await completeOnboarding(selectedLanguage);
    return failure;
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
