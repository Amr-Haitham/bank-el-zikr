import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/domain/usecases/get_random_prayer.dart';

class HomeCubit extends RequestCubit<Prayer> {
  final GetRandomPrayer getRandomPrayer;

  HomeCubit({
    required this.getRandomPrayer,
  }) : super(
          callOnCreate: false,
          request: () => getRandomPrayer(const NoParams()),
        );

  Future<void> loadRandomPrayer() async {
    execute(request: () => getRandomPrayer(const NoParams()));
  }
}
