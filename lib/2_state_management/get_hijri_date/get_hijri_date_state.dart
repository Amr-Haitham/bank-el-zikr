part of 'get_hijri_date_cubit.dart';

@immutable
sealed class GetHijriDateState {}

final class GetHijriDateInitial extends GetHijriDateState {}
final class GetHijriDateLoading extends GetHijriDateState {}
final class GetHijriDateLoaded extends GetHijriDateState {
  final HijriDate hijriDate;

  GetHijriDateLoaded({required this.hijriDate});
}
final class GetHijriDateError extends GetHijriDateState {}
