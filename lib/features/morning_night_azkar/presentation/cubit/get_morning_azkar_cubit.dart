import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/usecases/get_morning_azkar.dart';

class GetMorningAzkarCubit extends RequestCubit<List<MorningNightZikrEntity>> {
  final GetMorningAzkar getMorningAzkar;

  GetMorningAzkarCubit({
    required this.getMorningAzkar,
  }) : super(
          callOnCreate: true,
          request: () => getMorningAzkar(const NoParams()),
        );
}
