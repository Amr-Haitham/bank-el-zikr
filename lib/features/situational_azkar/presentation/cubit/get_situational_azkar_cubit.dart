import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/get_situational_azkar.dart';

class GetSituationalAzkarCubit extends RequestCubit<List<ZikrEntity>> {
  final GetSituationalAzkar getSituationalAzkar;

  GetSituationalAzkarCubit({
    required this.getSituationalAzkar,
  }) : super(
          callOnCreate: true,
          request: () => getSituationalAzkar(const NoParams()),
        );
}
