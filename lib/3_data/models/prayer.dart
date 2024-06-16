import 'package:hive_flutter/hive_flutter.dart';
part 'prayer.g.dart';

@HiveType(typeId: 4)
class Prayer {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String content;

  Prayer({required this.id, required this.content});
}
