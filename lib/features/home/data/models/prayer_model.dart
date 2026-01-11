import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:hive/hive.dart';

part 'prayer_model.g.dart';

@HiveType(typeId: 4)
class PrayerModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String content;

  PrayerModel({
    required this.id,
    required this.content,
  });

  Prayer toEntity() {
    return Prayer(
      id: id,
      content: content,
    );
  }

  factory PrayerModel.fromEntity(Prayer entity) {
    return PrayerModel(
      id: entity.id,
      content: entity.content,
    );
  }
}
