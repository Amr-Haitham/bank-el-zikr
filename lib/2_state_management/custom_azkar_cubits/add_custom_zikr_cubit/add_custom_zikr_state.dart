part of 'add_custom_zikr_cubit.dart';

@immutable
sealed class AddCustomZikrState {}

final class AddCustomZikrInitial extends AddCustomZikrState {}

final class AddCustomZikrLoading extends AddCustomZikrState {}

final class AddCustomZikrLoaded extends AddCustomZikrState {
  final Zikr zikr;

  AddCustomZikrLoaded({required this.zikr});
}

final class AddCustomZikrError extends AddCustomZikrState {}
