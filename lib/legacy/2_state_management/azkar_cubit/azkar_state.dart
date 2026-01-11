// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<Zikr> azkar;
  AzkarLoaded({
    required this.azkar,
  });
}

final class AzkarError extends AzkarState {}
