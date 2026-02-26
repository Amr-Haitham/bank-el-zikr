import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/domain/usecases/get_random_prayer.dart';

class GetRandomPrayerCubit extends RequestCubit<PrayerEntity> {
  final GetRandomPrayer getRandomPrayer;

  GetRandomPrayerCubit({
    required this.getRandomPrayer,
  }) : super(
          callOnCreate: true,
          request: () => getRandomPrayer(const NoParams()),
        );
}
