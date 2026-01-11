import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/usecases/get_all_azkar.dart';

/// Cubit responsible ONLY for getting all azkar
class GetAllAzkarCubit extends RequestCubit<List<Zikr>> {
  final GetAllAzkar getAllAzkar;

  GetAllAzkarCubit({
    required this.getAllAzkar,
  }) : super(
          callOnCreate: true,
          request: () => getAllAzkar(const NoParams()),
        );

  /// Reload azkar list
  Future<void> loadAzkar() async {
    await execute(request: () => getAllAzkar(const NoParams()));
  }
}
