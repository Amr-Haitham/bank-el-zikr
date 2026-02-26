import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/usecases/get_night_azkar.dart';

class GetNightAzkarCubit extends RequestCubit<List<MorningNightZikrEntity>> {
  final GetNightAzkar getNightAzkar;

  GetNightAzkarCubit({
    required this.getNightAzkar,
  }) : super(
          callOnCreate: true,
          request: () => getNightAzkar(const NoParams()),
        );
}
