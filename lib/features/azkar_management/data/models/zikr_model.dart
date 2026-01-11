import 'package:hive/hive.dart';
import '../../domain/entities/zikr.dart';

part 'zikr_model.g.dart';

/// Hive model for Zikr - maintains backward compatibility with existing data
@HiveType(typeId: 0) // Same typeId as old Zikr model
class ZikrModel extends HiveObject {
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

  ZikrModel({
    required this.id,
    required this.content,
    this.title,
    this.description,
    this.isCustomZikr = false,
  });

  /// Convert model to domain entity
  Zikr toEntity() {
    return Zikr(
      id: id,
      content: content,
      title: title,
      description: description,
      isCustomZikr: isCustomZikr ?? false,
    );
  }

  /// Create model from domain entity
  factory ZikrModel.fromEntity(Zikr entity) {
    return ZikrModel(
      id: entity.id,
      content: entity.content,
      title: entity.title,
      description: entity.description,
      isCustomZikr: entity.isCustomZikr,
    );
  }
}
