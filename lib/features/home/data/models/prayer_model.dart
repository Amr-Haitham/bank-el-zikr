import 'package:hive_flutter/hive_flutter.dart';
part 'prayer_model.g.dart';

@HiveType(typeId: 4)
class Prayer extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String? transliteration;
  @HiveField(3)
  final String? translation;
  @HiveField(4)
  final String? reference;

  Prayer({
    required this.id,
    required this.content,
    this.transliteration,
    this.translation,
    this.reference,
  });
}
