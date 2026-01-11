import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:hive/hive.dart';
part 'general_data_model.g.dart';

@HiveType(typeId: 2)
class GeneralData extends HiveObject {
  GeneralData({
    required this.currentZikrId,
    required this.currentCounter,
    required this.currentGoal,
    required this.accountBalance,
  });
  @HiveField(0)
  int currentZikrId;
  @HiveField(1)
  int currentCounter;
  @HiveField(2)
  int? currentGoal;
  @HiveField(3)
  int accountBalance;

  CounterStateEntity toEntity() {
    return CounterStateEntity(
      currentZikrId: currentZikrId,
      currentCounter: currentCounter,
      currentGoal: currentGoal,
      accountBalance: accountBalance,
    );
  }

  factory GeneralData.fromEntity(CounterStateEntity entity) {
    return GeneralData(
      currentZikrId: entity.currentZikrId,
      currentCounter: entity.currentCounter,
      currentGoal: entity.currentGoal,
      accountBalance: entity.accountBalance,
    );
  }
}
