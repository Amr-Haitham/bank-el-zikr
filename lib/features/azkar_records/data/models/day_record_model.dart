import 'package:hive/hive.dart';
part 'day_record_model.g.dart';

@HiveType(typeId: 6)
class DayRecord extends HiveObject {
  DayRecord({
    required this.id,
    required this.date,
    required this.repsByZikrKey,
    this.morningCompleted = false,
    this.eveningCompleted = false,
    this.sleepCompleted = false,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  Map<String, int> repsByZikrKey;

  @HiveField(3)
  bool morningCompleted;

  @HiveField(4)
  bool eveningCompleted;

  @HiveField(5)
  bool sleepCompleted;
}
