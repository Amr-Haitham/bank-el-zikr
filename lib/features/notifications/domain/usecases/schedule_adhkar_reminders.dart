import 'dart:math';

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

const _generalReminderWindowStartHour = 11;
const _generalReminderWindowEndHour = 17;

const _generalDhikrMessagesAr = [
  ('الاستغفار يفتح أبواب الرزق', 'استغفر الله العظيم'),
  ('أكثِر من الصلاة على النبي ﷺ', 'من صلى عليّ صلاة صلى الله عليه بها عشرًا'),
  ('كنز من كنوز الجنة بين يديك', 'قل: لا حول ولا قوة إلا بالله'),
  ('ازرع نخلة في الجنة', 'من قال: سبحان الله وبحمده غُرست له نخلة في الجنة'),
  ('أثقل ميزانك', 'سبحان الله والحمد لله ولا إله إلا الله والله أكبر'),
  ('قلبك يحتاج طمأنينة', 'ألا بذكر الله تطمئن القلوب'),
  ('أفضل ما قاله الأنبياء', 'قل: لا إله إلا الله وحده لا شريك له'),
];

const _generalDhikrMessagesEn = [
  ('Istighfar opens the doors of provision', "Say 'Astaghfirullah'"),
  ('Send blessings upon the Prophet ﷺ',
      'Whoever sends one blessing, Allah sends ten upon him'),
  ('A treasure from the treasures of Paradise',
      'Say: La hawla wala quwwata illa billah'),
  ('Plant a palm tree in Paradise', "Say 'SubhanAllahi wa bihamdihi'"),
  ('Make your scale heavier',
      'SubhanAllah, Alhamdulillah, La ilaha illallah, Allahu Akbar'),
  ('Your heart needs peace',
      'Verily, in the remembrance of Allah do hearts find rest'),
  ('The best of what the Prophets said',
      'Say: La ilaha illallah, wahdahu la sharika lah'),
];

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

    if (settings.generalDhikrReminderEnabled) {
      await _scheduleGeneralReminder(settings);
    }

    if (settings.reminderMode == 'auto') {
      return _scheduleAuto(settings);
    }
    return _scheduleManual(settings);
  }

  Future<void> _scheduleGeneralReminder(Settings settings) async {
    final messages = settings.generalDhikrReminderLanguage == 'en'
        ? _generalDhikrMessagesEn
        : _generalDhikrMessagesAr;
    final random = Random();
    final now = DateTime.now();

    for (var dayOffset = 0; dayOffset < _autoScheduleDays; dayOffset++) {
      final date = DateTime(now.year, now.month, now.day + dayOffset);
      final hour = _generalReminderWindowStartHour +
          random.nextInt(
              _generalReminderWindowEndHour - _generalReminderWindowStartHour);
      final minute = random.nextInt(60);
      final scheduled =
          DateTime(date.year, date.month, date.day, hour, minute);
      if (!scheduled.isAfter(now)) continue;

      final (title, body) = messages[dayOffset % messages.length];
      final result = await schedulerRepository.scheduleOnce(
        id: 3001 + dayOffset,
        title: title,
        body: body,
        dateTime: scheduled,
      );
      debugPrint(
          '[AdhkarReminders] general dhikr day$dayOffset -> $scheduled -> ${_describe(result)}');
    }
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
