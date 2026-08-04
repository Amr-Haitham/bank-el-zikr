import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';

class GeneralDataMapper {
  static CounterStateEntity toEntity(GeneralData model) {
    return CounterStateEntity(
      currentZikrKey: model.currentZikrKey,
      currentCounter: model.currentCounter,
      currentGoal: model.currentGoal,
      accountBalance: model.accountBalance,
    );
  }

  static GeneralData toModel(CounterStateEntity entity) {
    return GeneralData(
      currentZikrKey: entity.currentZikrKey,
      currentCounter: entity.currentCounter,
      currentGoal: entity.currentGoal,
      accountBalance: entity.accountBalance,
    );
  }
}
