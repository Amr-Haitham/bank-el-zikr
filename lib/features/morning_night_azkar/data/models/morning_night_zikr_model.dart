import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
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

  MorningOrNightZikr(
      {required this.id,
      required this.content,
      this.title,
      required this.count,
      required this.favor});

  MorningNightZikrEntity toEntity() {
    return MorningNightZikrEntity(
      id: id,
      title: title,
      content: content,
      count: count,
      favor: favor,
    );
  }

  factory MorningOrNightZikr.fromEntity(MorningNightZikrEntity entity) {
    return MorningOrNightZikr(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      count: entity.count,
      favor: entity.favor,
    );
  }
}
