// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'day_zikr_record.g.dart';

@HiveType(typeId: 1)
class DayZikrRecord {
  DayZikrRecord({
    required this.id,
    required this.dateTime,
    required this.azkarRecordById,
  });
  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  Map<int, int> azkarRecordById;
}
