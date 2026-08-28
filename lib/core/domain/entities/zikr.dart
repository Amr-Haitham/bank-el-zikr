import 'package:equatable/equatable.dart';

class ZikrEntity extends Equatable {
  final int id;
  final String key;
  final String content;
  final String? contentEn;
  final String? contentTransliteration;
  final String? title;
  final String? titleEn;
  final String? description;
  final String? descriptionEn;
  final String? source;
  final String? sourceEn;
  final int count;
  final String category;
  final bool isCustomZikr;

  const ZikrEntity({
    required this.id,
    required this.key,
    required this.content,
    this.contentEn,
    this.contentTransliteration,
    this.title,
    this.titleEn,
    this.description,
    this.descriptionEn,
    this.source,
    this.sourceEn,
    this.count = 1,
    required this.category,
    this.isCustomZikr = false,
  });

  bool? get isMorning {
    if (category == 'morning') return true;
    if (category == 'evening') return false;
    return null;
  }

  String displayTitle(bool isEnglish) {
    if (isEnglish && titleEn != null) return titleEn!;
    return title ?? content;
  }

  static List<ZikrEntity> tasbihEligible(List<ZikrEntity> azkar) {
    final filtered = azkar
        .where((zikr) => zikr.category == 'general' || zikr.isCustomZikr)
        .toList();
    return [
      ...filtered.where((z) => z.isCustomZikr),
      ...filtered.where((z) => !z.isCustomZikr),
    ];
  }

  @override
  List<Object?> get props => [
        id,
        key,
        content,
        contentEn,
        contentTransliteration,
        title,
        titleEn,
        description,
        descriptionEn,
        source,
        sourceEn,
        count,
        category,
        isCustomZikr,
      ];

  ZikrEntity copyWith({
    int? id,
    String? key,
    String? content,
    String? contentEn,
    String? contentTransliteration,
    String? title,
    String? titleEn,
    String? description,
    String? descriptionEn,
    String? source,
    String? sourceEn,
    int? count,
    String? category,
    bool? isCustomZikr,
  }) {
    return ZikrEntity(
      id: id ?? this.id,
      key: key ?? this.key,
      content: content ?? this.content,
      contentEn: contentEn ?? this.contentEn,
      contentTransliteration:
          contentTransliteration ?? this.contentTransliteration,
      title: title ?? this.title,
      titleEn: titleEn ?? this.titleEn,
      description: description ?? this.description,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      source: source ?? this.source,
      sourceEn: sourceEn ?? this.sourceEn,
      count: count ?? this.count,
      category: category ?? this.category,
      isCustomZikr: isCustomZikr ?? this.isCustomZikr,
    );
  }
}
