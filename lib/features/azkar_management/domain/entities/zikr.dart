import 'package:equatable/equatable.dart';

class ZikrEntity extends Equatable {
  final int id;
  final String content;
  final String? title;
  final String? description;
  final bool isCustomZikr;

  /// Latin-script transliteration of [content] (e.g. "Subhan Allah"). Null
  /// for custom user-added azkar, which have no transliteration data.
  final String? transliteration;

  /// English translation of [content] (e.g. "Glory be to Allah"). Null for
  /// custom user-added azkar, which have no translation data.
  final String? translation;

  const ZikrEntity({
    required this.id,
    required this.content,
    this.title,
    this.description,
    this.isCustomZikr = false,
    this.transliteration,
    this.translation,
  });

  @override
  List<Object?> get props => [
        id,
        content,
        title,
        description,
        isCustomZikr,
        transliteration,
        translation,
      ];

  ZikrEntity copyWith({
    int? id,
    String? content,
    String? title,
    String? description,
    bool? isCustomZikr,
    String? transliteration,
    String? translation,
  }) {
    return ZikrEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      description: description ?? this.description,
      isCustomZikr: isCustomZikr ?? this.isCustomZikr,
      transliteration: transliteration ?? this.transliteration,
      translation: translation ?? this.translation,
    );
  }
}
