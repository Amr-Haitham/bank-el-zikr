import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/location_repository.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/notification_scheduler_repository.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/cancel_adhkar_reminders.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/get_prayer_times.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

const _autoScheduleDays = 7;
const _defaultMorningTime = TimeOfDay(hour: 5, minute: 0);
const _defaultEveningTime = TimeOfDay(hour: 18, minute: 40);

String _describe(RequestResult<void> result) {
  return result.fold((f) => 'FAILED: ${f.message}', (_) => 'OK');
}

class ScheduleAdhkarReminders implements UseCase<void, NoParams> {
  final SettingsRepository settingsRepository;
  final LocationRepository locationRepository;
  final GetPrayerTimes getPrayerTimes;
  final NotificationSchedulerRepository schedulerRepository;

  ScheduleAdhkarReminders({
    required this.settingsRepository,
    required this.locationRepository,
    required this.getPrayerTimes,
    required this.schedulerRepository,
  });

  @override
  Future<RequestResult<void>> call(NoParams params) async {
    await schedulerRepository.cancelAll(reminderNotificationIds);

    final settingsResult = await settingsRepository.getSettings();
    final settings = settingsResult.fold((_) => null, (s) => s);
    if (settings == null || !settings.adhkarRemindersEnabled) {
      debugPrint('[AdhkarReminders] reminders disabled, nothing scheduled.');
      return const Right(null);
    }

    if (settings.reminderMode == 'auto') {
      return _scheduleAuto(settings);
    }
    return _scheduleManual(settings);
  }

  Future<RequestResult<void>> _scheduleManual(Settings settings) async {
    if (settings.morningReminderEnabled) {
      final time = settings.morningZikrAlarm ?? _defaultMorningTime;
      final result = await schedulerRepository.scheduleDaily(
        id: 1000,
        title: 'أذكار الصباح',
        body: 'حان وقت أذكار الصباح',
        time: time,
      );
      debugPrint('[AdhkarReminders] morning scheduled for $time -> ${_describe(result)}');
    }

    if (settings.eveningReminderEnabled) {
      final time = settings.nightZikrAlarm ?? _defaultEveningTime;
      final result = await schedulerRepository.scheduleDaily(
        id: 2000,
        title: 'أذكار المساء',
        body: 'حان وقت أذكار المساء',
        time: time,
      );
      debugPrint('[AdhkarReminders] evening scheduled for $time -> ${_describe(result)}');
    }

    return const Right(null);
  }

  Future<RequestResult<void>> _scheduleAuto(Settings settings) async {
    final coordinatesResult = await locationRepository.getCurrentCoordinates();
    if (coordinatesResult.isLeft()) {
      debugPrint('[AdhkarReminders] could not get location: $coordinatesResult');
      return coordinatesResult.fold((failure) => Left(failure), (_) => const Right(null));
    }
    final coordinates =
        coordinatesResult.fold((_) => null, (coordinates) => coordinates)!;

    final now = DateTime.now();

    for (var dayOffset = 0; dayOffset < _autoScheduleDays; dayOffset++) {
      final date = DateTime(now.year, now.month, now.day + dayOffset);
      final prayerTimesResult = await getPrayerTimes(
        GetPrayerTimesParams(coordinates: coordinates, date: date),
      );

      final prayerTimes = prayerTimesResult.fold((_) => null, (p) => p);
      if (prayerTimes == null) continue;

      if (settings.morningReminderEnabled && prayerTimes.fajr.isAfter(now)) {
        final result = await schedulerRepository.scheduleOnce(
          id: 1001 + dayOffset,
          title: 'أذكار الصباح',
          body: 'حان وقت أذكار الصباح - صلاة الفجر',
          dateTime: prayerTimes.fajr,
        );
        debugPrint(
            '[AdhkarReminders] auto morning day$dayOffset -> ${prayerTimes.fajr} -> ${_describe(result)}');
      }

      if (settings.eveningReminderEnabled && prayerTimes.asr.isAfter(now)) {
        final result = await schedulerRepository.scheduleOnce(
          id: 2001 + dayOffset,
          title: 'أذكار المساء',
          body: 'حان وقت أذكار المساء - صلاة العصر',
          dateTime: prayerTimes.asr,
        );
        debugPrint(
            '[AdhkarReminders] auto evening day$dayOffset -> ${prayerTimes.asr} -> ${_describe(result)}');
      }
    }

    return const Right(null);
  }
}
