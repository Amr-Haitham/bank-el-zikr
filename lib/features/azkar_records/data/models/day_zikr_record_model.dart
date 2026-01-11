import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_zikr_record.dart';
import 'package:hive/hive.dart';
part 'day_zikr_record_model.g.dart';

@HiveType(typeId: 1)
class DayZikrRecord extends HiveObject {
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

  DayZikrRecordEntity toEntity() {
    return DayZikrRecordEntity(
      id: id,
      dateTime: dateTime,
      azkarRecordById: Map<int, int>.from(azkarRecordById),
    );
  }

  factory DayZikrRecord.fromEntity(DayZikrRecordEntity entity) {
    return DayZikrRecord(
      id: entity.id,
      dateTime: entity.dateTime,
      azkarRecordById: Map<int, int>.from(entity.azkarRecordById),
    );
  }
}
