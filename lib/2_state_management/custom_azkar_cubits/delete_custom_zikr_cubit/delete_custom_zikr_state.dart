part of 'delete_custom_zikr_cubit.dart';

@immutable
sealed class DeleteCustomZikrState {}

final class DeleteCustomZikrInitial extends DeleteCustomZikrState {}

final class DeleteCustomZikrLoading extends DeleteCustomZikrState {}

final class DeleteCustomZikrLoaded extends DeleteCustomZikrState {
}

final class DeleteCustomZikrError extends DeleteCustomZikrState {}
