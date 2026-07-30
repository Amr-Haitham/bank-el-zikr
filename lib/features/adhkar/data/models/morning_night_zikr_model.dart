import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'morning_night_zikr_model.g.dart';

@HiveType(typeId: 3)
class MorningOrNightZikr extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final int count;
  @HiveField(4)
  final String? favor;
  @HiveField(5)
  final String? source;
  @HiveField(6)
  final String? contentTransliteration;
  @HiveField(7)
  final String? contentEn;
  @HiveField(8)
  final String? titleEn;
  @HiveField(9)
  final String? favorEn;
  @HiveField(10)
  final String? sourceEn;

  MorningOrNightZikr(
      {required this.id,
      required this.content,
      this.title,
      required this.count,
      required this.favor,
      this.source,
      this.contentTransliteration,
      this.contentEn,
      this.titleEn,
      this.favorEn,
      this.sourceEn});

  /// [category] is passed by the caller ('morning' or 'evening') since
  /// morning/evening azkar are segregated by Hive box, not by a stored field.
  ZikrEntity toEntity({required String category}) {
    return ZikrEntity(
      id: id,
      title: title,
      titleEn: titleEn,
      content: content,
      count: count,
      description: favor,
      descriptionEn: favorEn,
      source: source,
      sourceEn: sourceEn,
      contentTransliteration: contentTransliteration,
      contentEn: contentEn,
      category: category,
    );
  }

  factory MorningOrNightZikr.fromEntity(ZikrEntity entity) {
    return MorningOrNightZikr(
      id: entity.id,
      title: entity.title,
      titleEn: entity.titleEn,
      content: entity.content,
      count: entity.count,
      favor: entity.description,
      favorEn: entity.descriptionEn,
      source: entity.source,
      sourceEn: entity.sourceEn,
      contentTransliteration: entity.contentTransliteration,
      contentEn: entity.contentEn,
    );
  }
}
