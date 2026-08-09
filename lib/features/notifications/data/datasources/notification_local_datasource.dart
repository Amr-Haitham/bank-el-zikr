import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

abstract class NotificationLocalDataSource {
  Future<void> init();
  Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  });
  Future<void> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  });
  Future<void> cancel(int id);
  Future<void> cancelAll(List<int> ids);
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final FlutterLocalNotificationsPlugin plugin;

  static const _channelId = 'adhkar_reminders';
  static const _channelName = 'تذكير الأذكار';
  static const _channelDescription = 'تذكيرات أذكار الصباح والمساء';

  AndroidScheduleMode _scheduleMode = AndroidScheduleMode.inexactAllowWhileIdle;

  NotificationLocalDataSourceImpl({required this.plugin});

  @override
  Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosSettings = DarwinInitializationSettings();
    await plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    final androidImplementation = plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await androidImplementation?.requestNotificationsPermission();

    // Exact-time scheduling on Android 12+ needs a separate, user-granted
    // "Alarms & reminders" permission. If it isn't granted, zonedSchedule
    // with an exact mode throws and the reminder silently never fires — so
    // fall back to the inexact mode (fires within ~a few minutes of the
    // target time) instead of failing outright.
    await androidImplementation?.requestExactAlarmsPermission();
    final canScheduleExact =
        await androidImplementation?.canScheduleExactNotifications() ?? false;
    _scheduleMode = canScheduleExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;

    await plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    debugPrint('[Notifications] tz.local=${tz.local.name} '
        'deviceNow=${DateTime.now()} tzNow=${tz.TZDateTime.now(tz.local)} '
        'canScheduleExact=$canScheduleExact scheduleMode=$_scheduleMode');
  }

  NotificationDetails get _details => const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      );

  @override
  Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    debugPrint('[Notifications] scheduleDaily id=$id now=$now '
        'scheduled=$scheduled mode=$_scheduleMode');

    await plugin.zonedSchedule(
      id,
      title,
      body,
      scheduled,
      _details,
      androidScheduleMode: _scheduleMode,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    final pending = await plugin.pendingNotificationRequests();
    debugPrint('[Notifications] pending after scheduleDaily: '
        '${pending.map((p) => '${p.id}:${p.title}').toList()}');
  }

  @override
  Future<void> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    final scheduled = tz.TZDateTime.from(dateTime, tz.local);

    await plugin.zonedSchedule(
      id,
      title,
      body,
      scheduled,
      _details,
      androidScheduleMode: _scheduleMode,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  Future<void> cancel(int id) => plugin.cancel(id);

  @override
  Future<void> cancelAll(List<int> ids) async {
    for (final id in ids) {
      await plugin.cancel(id);
    }
  }
}
