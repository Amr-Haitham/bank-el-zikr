import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';

class PrayerMapper {
  static PrayerEntity toEntity(Prayer model) {
    return PrayerEntity(
      id: model.id,
      content: model.content,
      transliteration: model.transliteration,
      translation: model.translation,
      reference: model.reference,
    );
  }

  static Prayer toModel(PrayerEntity entity) {
    return Prayer(
      id: entity.id,
      content: entity.content,
      transliteration: entity.transliteration,
      translation: entity.translation,
      reference: entity.reference,
    );
  }
}
