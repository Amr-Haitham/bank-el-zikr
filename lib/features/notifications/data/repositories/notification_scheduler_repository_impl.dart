import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/features/notifications/data/datasources/notification_local_datasource.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/notification_scheduler_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NotificationSchedulerRepositoryImpl
    implements NotificationSchedulerRepository {
  final NotificationLocalDataSource localDataSource;

  NotificationSchedulerRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<void>> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    try {
      await localDataSource.scheduleDaily(
          id: id, title: title, body: body, time: time);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    try {
      await localDataSource.scheduleOnce(
          id: id, title: title, body: body, dateTime: dateTime);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> cancel(int id) async {
    try {
      await localDataSource.cancel(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> cancelAll(List<int> ids) async {
    try {
      await localDataSource.cancelAll(ids);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
