import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/features/notifications/data/datasources/location_local_datasource.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/coordinates.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource localDataSource;

  LocationRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<CoordinatesEntity>> getCurrentCoordinates() async {
    try {
      final coordinates = await localDataSource.getCurrentCoordinates();
      return Right(CoordinatesEntity(
        latitude: coordinates.latitude,
        longitude: coordinates.longitude,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
