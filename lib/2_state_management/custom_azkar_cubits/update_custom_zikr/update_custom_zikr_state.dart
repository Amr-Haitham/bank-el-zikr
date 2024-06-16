part of 'update_custom_zikr_cubit.dart';

@immutable
sealed class UpdateCustomZikrState {}

final class UpdateCustomZikrInitial extends UpdateCustomZikrState {}

final class UpdateCustomZikrLoading extends UpdateCustomZikrState {}

final class UpdateCustomZikrLoaded extends UpdateCustomZikrState {}

final class UpdateCustomZikrError extends UpdateCustomZikrState {}
