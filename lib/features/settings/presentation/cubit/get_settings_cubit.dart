import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/get_settings.dart';

class GetSettingsCubit extends RequestCubit<Settings> {
  final GetSettings getSettings;

  GetSettingsCubit({
    required this.getSettings,
  }) : super(
          callOnCreate: true,
          request: () => getSettings(const NoParams()),
        );
}
