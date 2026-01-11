// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';

part 'zikr_model.g.dart';

@HiveType(typeId: 0)
class Zikr extends HiveObject {
  Zikr(
      {required this.id,
      required this.content,
      this.description,
      this.title,
      this.isCustomZikr = false});
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

  ZikrEntity toEntity() {
    return ZikrEntity(
      id: id,
      content: content,
      title: title,
      description: description,
      isCustomZikr: isCustomZikr ?? false,
    );
  }

  factory Zikr.fromEntity(ZikrEntity entity) {
    return Zikr(
      id: entity.id,
      content: entity.content,
      title: entity.title,
      description: entity.description,
      isCustomZikr: entity.isCustomZikr,
    );
  }
}
