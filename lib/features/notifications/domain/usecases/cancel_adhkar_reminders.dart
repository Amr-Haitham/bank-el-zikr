import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/notification_scheduler_repository.dart';

const reminderNotificationIds = [
  1000,
  2000,
  1001,
  1002,
  1003,
  1004,
  1005,
  1006,
  1007,
  2001,
  2002,
  2003,
  2004,
  2005,
  2006,
  2007,
];

class CancelAdhkarReminders implements UseCase<void, NoParams> {
  final NotificationSchedulerRepository repository;

  CancelAdhkarReminders(this.repository);

  @override
  Future<RequestResult<void>> call(NoParams params) {
    return repository.cancelAll(reminderNotificationIds);
  }
}
