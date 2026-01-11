/// Shared cubit instances that need to be accessed across multiple routes
/// These are static singletons that maintain state across navigation
import '../../legacy/2_state_management/azkar_cubit/azkar_cubit.dart';
import '../../legacy/2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import '../../legacy/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import '../../legacy/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';

class SharedCubits {
  // Singleton instance
  static final SharedCubits _instance = SharedCubits._internal();
  factory SharedCubits() => _instance;
  SharedCubits._internal();

  // Shared cubit instances
  final UpdateGeneralDataCubit updateGeneralDataCubit =
      UpdateGeneralDataCubit();
  final AzkarCubit azkarCubit = AzkarCubit();
  final AddCustomZikrCubit addCustomZikrCubit = AddCustomZikrCubit();
  final GetCurrentZikrCubit getCurrentZikrCubit = GetCurrentZikrCubit();
}
