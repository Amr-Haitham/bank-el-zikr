import 'package:equatable/equatable.dart';

class PrayerTimesEntity extends Equatable {
  final DateTime fajr;
  final DateTime asr;

  const PrayerTimesEntity({required this.fajr, required this.asr});

  @override
  List<Object?> get props => [fajr, asr];
}
