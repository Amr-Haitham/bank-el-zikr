// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'zikr_model.g.dart';

@HiveType(typeId: 0)
class Zikr extends HiveObject {
  Zikr(
      {required this.id,
      required this.zikrKey,
      required this.content,
      this.description,
      this.title,
      this.isCustomZikr = false,
      this.category = 'uncategorized',
      this.count = 1,
      this.source,
      this.contentTransliteration,
      this.contentEn,
      this.titleEn,
      this.descriptionEn,
      this.sourceEn});
  @HiveField(0)
  int id;

  @HiveField(1)
  String content;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  bool? isCustomZikr;
  @HiveField(5, defaultValue: 'uncategorized')
  String category;
  @HiveField(6, defaultValue: 1)
  int count;
  @HiveField(7)
  String? source;
  @HiveField(8)
  String? contentTransliteration;
  @HiveField(9)
  String? contentEn;
  @HiveField(10)
  String? titleEn;
  @HiveField(11)
  String? descriptionEn;
  @HiveField(12)
  String? sourceEn;
  @HiveField(13, defaultValue: '')
  String zikrKey;
}
