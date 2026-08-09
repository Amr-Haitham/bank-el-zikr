import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/prayer_times.dart';
import 'package:bank_el_ziker/features/notifications/domain/repositories/location_repository.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/get_prayer_times.dart';
import 'package:dartz/dartz.dart';

class PrayerTimesCubit extends RequestCubit<PrayerTimesEntity> {
  final LocationRepository locationRepository;
  final GetPrayerTimes getPrayerTimes;

  PrayerTimesCubit({
    required this.locationRepository,
    required this.getPrayerTimes,
  });

  Future<void> fetch() async {
    await execute(request: _fetchPrayerTimes);
  }

  Future<RequestResult<PrayerTimesEntity>> _fetchPrayerTimes() async {
    final coordinatesResult = await locationRepository.getCurrentCoordinates();
    if (coordinatesResult.isLeft()) {
      return coordinatesResult.fold(
          (failure) => Left(failure), (_) => throw StateError('unreachable'));
    }

    final coordinates =
        coordinatesResult.fold((_) => null, (coordinates) => coordinates)!;

    return getPrayerTimes(
      GetPrayerTimesParams(coordinates: coordinates, date: DateTime.now()),
    );
  }
}
