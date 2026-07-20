import 'package:equatable/equatable.dart';

class PrayerEntity extends Equatable {
  final int id;
  final String content;
  final String? transliteration;
  final String? translation;
  final String? reference;

  const PrayerEntity({
    required this.id,
    required this.content,
    this.transliteration,
    this.translation,
    this.reference,
  });

  @override
  List<Object?> get props =>
      [id, content, transliteration, translation, reference];
}
