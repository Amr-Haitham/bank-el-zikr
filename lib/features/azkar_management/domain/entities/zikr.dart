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
}
