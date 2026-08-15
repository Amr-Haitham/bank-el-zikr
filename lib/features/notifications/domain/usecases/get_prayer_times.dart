import 'package:adhan_dart/adhan_dart.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/coordinates.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/prayer_times.dart';
import 'package:dartz/dartz.dart';

class GetPrayerTimesParams {
  final CoordinatesEntity coordinates;
  final DateTime date;

  const GetPrayerTimesParams({required this.coordinates, required this.date});
}

class GetPrayerTimes
    implements UseCase<PrayerTimesEntity, GetPrayerTimesParams> {
  @override
  Future<RequestResult<PrayerTimesEntity>> call(
      GetPrayerTimesParams params) async {
    final coordinates = Coordinates(
      params.coordinates.latitude,
      params.coordinates.longitude,
    );
    final calculationParameters =
        CalculationMethodParameters.muslimWorldLeague();
    final prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: params.date,
      calculationParameters: calculationParameters,
    );

    return Right(PrayerTimesEntity(
      fajr: prayerTimes.fajr.toLocal(),
      asr: prayerTimes.asr.toLocal(),
    ));
  }
}
