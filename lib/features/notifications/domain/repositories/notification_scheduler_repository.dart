import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:flutter/material.dart';

abstract class NotificationSchedulerRepository {
  /// Schedules a notification that repeats every day at [time].
  Future<RequestResult<void>> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  });

  /// Schedules a single, non-repeating notification at [dateTime].
  Future<RequestResult<void>> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  });

  Future<RequestResult<void>> cancel(int id);

  Future<RequestResult<void>> cancelAll(List<int> ids);
}
