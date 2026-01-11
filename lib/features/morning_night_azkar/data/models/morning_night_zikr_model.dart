import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:hive/hive.dart';

part 'morning_night_zikr_model.g.dart';

@HiveType(typeId: 3)
class MorningNightZikrModel extends HiveObject {
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

  MorningNightZikrModel({
    required this.id,
    this.title,
    required this.content,
    required this.count,
    this.favor,
  });

  MorningNightZikr toEntity() {
    return MorningNightZikr(
      id: id,
      title: title,
      content: content,
      count: count,
      favor: favor,
    );
  }

  factory MorningNightZikrModel.fromEntity(MorningNightZikr entity) {
    return MorningNightZikrModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      count: entity.count,
      favor: entity.favor,
    );
  }
}
