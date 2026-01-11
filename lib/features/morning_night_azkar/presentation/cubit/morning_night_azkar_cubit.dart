import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/usecases/get_morning_azkar.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/usecases/get_night_azkar.dart';

class MorningNightAzkarCubit extends RequestCubit<List<MorningNightZikrEntity>> {
  final GetMorningAzkar getMorningAzkar;
  final GetNightAzkar getNightAzkar;

  MorningNightAzkarCubit({
    required this.getMorningAzkar,
    required this.getNightAzkar,
  }) : super(callOnCreate: false);

  Future<void> loadMorningAzkar() async {
    execute(request: () => getMorningAzkar(const NoParams()));
  }

  Future<void> loadNightAzkar() async {
    execute(request: () => getNightAzkar(const NoParams()));
  }
}
