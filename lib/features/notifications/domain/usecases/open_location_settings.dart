import 'package:bank_el_ziker/features/notifications/domain/repositories/location_repository.dart';

class OpenLocationSettings {
  final LocationRepository repository;

  OpenLocationSettings(this.repository);

  Future<void> call() => repository.openLocationSettings();
}
