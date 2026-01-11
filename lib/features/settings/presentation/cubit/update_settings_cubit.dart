import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/update_settings.dart';

class UpdateSettingsCubit extends RequestCubit<void> {
  final UpdateSettings updateSettings;

  UpdateSettingsCubit({
    required this.updateSettings,
  }) : super();

  Future<void> executeUpdate(UpdateSettingsParams params) async {
    execute(request: () => updateSettings(params));
  }
}
