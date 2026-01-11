import 'package:equatable/equatable.dart';

/// Domain entity representing a Zikr (remembrance/dhikr)
/// Can be either a default zikr or a custom user-created zikr
class Zikr extends Equatable {
  final int id;
  final String content;
  final String? title;
  final String? description;
  final bool isCustomZikr;

  const Zikr({
    required this.id,
    required this.content,
    this.title,
    this.description,
    this.isCustomZikr = false,
  });

  @override
  List<Object?> get props => [id, content, title, description, isCustomZikr];

  Zikr copyWith({
    int? id,
    String? content,
    String? title,
    String? description,
    bool? isCustomZikr,
  }) {
    return Zikr(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      description: description ?? this.description,
      isCustomZikr: isCustomZikr ?? this.isCustomZikr,
    );
  }
}
