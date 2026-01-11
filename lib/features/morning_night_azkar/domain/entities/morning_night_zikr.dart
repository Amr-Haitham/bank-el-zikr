import 'package:equatable/equatable.dart';

class MorningNightZikr extends Equatable {
  final int id;
  final String? title;
  final String content;
  final int count;
  final String? favor;

  const MorningNightZikr({
    required this.id,
    this.title,
    required this.content,
    required this.count,
    this.favor,
  });

  @override
  List<Object?> get props => [id, title, content, count, favor];
}
