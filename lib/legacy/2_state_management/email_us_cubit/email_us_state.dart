part of 'email_us_cubit.dart';

@immutable
sealed class EmailUsState {}

final class EmailUsInitial extends EmailUsState {}
final class EmailUsLoading extends EmailUsState {}
final class EmailUsLoaded extends EmailUsState {}
final class EmailUsError extends EmailUsState {}
