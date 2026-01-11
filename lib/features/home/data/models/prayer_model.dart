import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'prayer_model.g.dart';

@HiveType(typeId: 4)
class Prayer extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String content;

  Prayer({required this.id, required this.content});

  PrayerEntity toEntity() {
    return PrayerEntity(
      id: id,
      content: content,
    );
  }

  factory Prayer.fromEntity(PrayerEntity entity) {
    return Prayer(
      id: entity.id,
      content: entity.content,
    );
  }
}
