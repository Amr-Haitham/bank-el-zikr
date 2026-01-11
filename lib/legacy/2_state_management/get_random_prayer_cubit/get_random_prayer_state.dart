part of 'get_random_prayer_cubit.dart';

@immutable
sealed class GetRandomPrayerState {}

final class GetRandomPrayerInitial extends GetRandomPrayerState {}

final class GetRandomPrayerLoading extends GetRandomPrayerState {}

final class GetRandomPrayerLoaded extends GetRandomPrayerState {
  final Prayer prayer;

  GetRandomPrayerLoaded({required this.prayer});
}

final class GetRandomPrayerError extends GetRandomPrayerState {}
