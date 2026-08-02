import 'package:bank_el_ziker/core/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';

class ZikrMapper {
  static ZikrEntity toEntity(Zikr model) {
    return ZikrEntity(
      id: model.id,
      key: model.zikrKey,
      content: model.content,
      title: model.title,
      titleEn: model.titleEn,
      description: model.description,
      descriptionEn: model.descriptionEn,
      isCustomZikr: model.isCustomZikr ?? false,
      category: model.category,
      count: model.count,
      source: model.source,
      sourceEn: model.sourceEn,
      contentTransliteration: model.contentTransliteration,
      contentEn: model.contentEn,
    );
  }

  static Zikr toModel(ZikrEntity entity) {
    return Zikr(
      id: entity.id,
      zikrKey: entity.key,
      content: entity.content,
      title: entity.title,
      titleEn: entity.titleEn,
      description: entity.description,
      descriptionEn: entity.descriptionEn,
      isCustomZikr: entity.isCustomZikr,
      category: entity.category,
      count: entity.count,
      source: entity.source,
      sourceEn: entity.sourceEn,
      contentTransliteration: entity.contentTransliteration,
      contentEn: entity.contentEn,
    );
  }
}
