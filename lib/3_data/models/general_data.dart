// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'general_data.g.dart';

@HiveType(typeId: 2)
class GeneralData {
  
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

}
