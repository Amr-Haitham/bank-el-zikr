import 'package:hive_flutter/hive_flutter.dart';
part 'morning_or_night_zikr.g.dart';

@HiveType(typeId: 3)
class MorningOrNightZikr {
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
}

