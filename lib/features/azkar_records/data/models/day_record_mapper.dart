import 'package:bank_el_ziker/features/azkar_records/data/models/day_record_model.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_record.dart';

class DayRecordMapper {
  static DayRecordEntity toEntity(DayRecord model) {
    return DayRecordEntity(
      id: model.id,
      date: model.date,
      repsByZikrKey: Map<String, int>.from(model.repsByZikrKey),
      morningCompleted: model.morningCompleted,
      eveningCompleted: model.eveningCompleted,
      sleepCompleted: model.sleepCompleted,
    );
  }

  static DayRecord toModel(DayRecordEntity entity) {
    return DayRecord(
      id: entity.id,
      date: entity.date,
      repsByZikrKey: Map<String, int>.from(entity.repsByZikrKey),
      morningCompleted: entity.morningCompleted,
      eveningCompleted: entity.eveningCompleted,
      sleepCompleted: entity.sleepCompleted,
    );
  }
}
