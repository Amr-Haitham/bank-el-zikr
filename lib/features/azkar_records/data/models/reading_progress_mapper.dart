import 'package:bank_el_ziker/features/azkar_records/data/models/reading_progress_model.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/reading_progress.dart';

class ReadingProgressMapper {
  static ReadingProgressEntity toEntity(ReadingProgress model) {
    return ReadingProgressEntity(
      category: model.category,
      date: model.date,
      lastReadAt: model.lastReadAt,
      completedCount: model.completedCount,
      totalCount: model.totalCount,
      repsByZikrKey: Map<String, int>.from(model.repsByZikrKey),
    );
  }

  static ReadingProgress toModel(ReadingProgressEntity entity) {
    return ReadingProgress(
      category: entity.category,
      date: entity.date,
      lastReadAt: entity.lastReadAt,
      completedCount: entity.completedCount,
      totalCount: entity.totalCount,
      repsByZikrKey: Map<String, int>.from(entity.repsByZikrKey),
    );
  }
}
