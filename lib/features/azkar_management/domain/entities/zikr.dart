import 'package:equatable/equatable.dart';

class ZikrEntity extends Equatable {
  final int id;
  final String content;
  final String? title;
  final String? description;
  final bool isCustomZikr;

  const ZikrEntity({
    required this.id,
    required this.content,
    this.title,
    this.description,
    this.isCustomZikr = false,
  });

  @override
  List<Object?> get props => [id, content, title, description, isCustomZikr];

  ZikrEntity copyWith({
    int? id,
    String? content,
    String? title,
    String? description,
    bool? isCustomZikr,
  }) {
    return ZikrEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      description: description ?? this.description,
      isCustomZikr: isCustomZikr ?? this.isCustomZikr,
    );
  }
}
