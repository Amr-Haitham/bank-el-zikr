import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/coordinates.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/location_repository.dart';

class GetCurrentCoordinates implements UseCase<CoordinatesEntity, NoParams> {
  final LocationRepository repository;

  GetCurrentCoordinates(this.repository);

  @override
  Future<RequestResult<CoordinatesEntity>> call(NoParams params) {
    return repository.getCurrentCoordinates();
  }
}
