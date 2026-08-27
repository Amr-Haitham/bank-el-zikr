import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/coordinates.dart';

abstract class LocationRepository {
  Future<RequestResult<CoordinatesEntity>> getCurrentCoordinates();
  Future<void> openLocationSettings();
}
