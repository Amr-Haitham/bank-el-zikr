// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'zikr.g.dart';

@HiveType(typeId: 0)
class Zikr {
  Zikr(
      {required this.id,
      required this.content,
      required this.description,
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
}
