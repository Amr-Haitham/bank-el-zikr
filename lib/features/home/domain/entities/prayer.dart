import 'package:equatable/equatable.dart';

class Prayer extends Equatable {
  final int id;
  final String content;

  const Prayer({
    required this.id,
    required this.content,
  });

  @override
  List<Object?> get props => [id, content];
}
