import 'package:hive/hive.dart';
import '../../domain/entities/day_zikr_record.dart';

part 'day_zikr_record_model.g.dart';

/// Data model for DayZikrRecord with Hive persistence
/// Uses typeId: 1 for backward compatibility with old model
@HiveType(typeId: 1)
class DayZikrRecordModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  Map<int, int> azkarRecordById;

  DayZikrRecordModel({
    required this.id,
    required this.dateTime,
    required this.azkarRecordById,
  });

  /// Convert model to domain entity
  DayZikrRecord toEntity() {
    return DayZikrRecord(
      id: id,
      dateTime: dateTime,
      azkarRecordById: azkarRecordById,
    );
  }

  /// Create model from domain entity
  factory DayZikrRecordModel.fromEntity(DayZikrRecord entity) {
    return DayZikrRecordModel(
      id: entity.id,
      dateTime: entity.dateTime,
      azkarRecordById: entity.azkarRecordById,
    );
  }
}
