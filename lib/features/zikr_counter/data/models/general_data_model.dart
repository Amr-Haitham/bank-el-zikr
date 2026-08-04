import 'package:hive/hive.dart';
part 'general_data_model.g.dart';

@HiveType(typeId: 2)
class GeneralData extends HiveObject {
  GeneralData({
    required this.currentZikrKey,
    required this.currentCounter,
    required this.currentGoal,
    required this.accountBalance,
  });
  @HiveField(0)
  String currentZikrKey;
  @HiveField(1)
  int currentCounter;
  @HiveField(2)
  int? currentGoal;
  @HiveField(3)
  int accountBalance;
}
