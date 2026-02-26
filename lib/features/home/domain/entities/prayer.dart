import 'package:equatable/equatable.dart';

class PrayerEntity extends Equatable {
  final int id;
  final String content;

  const PrayerEntity({
    required this.id,
    required this.content,
  });

  @override
  List<Object?> get props => [id, content];
}
