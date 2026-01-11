part of 'get_current_zikr_cubit.dart';

@immutable
sealed class GetCurrentZikrState {}

final class GetCurrentZikrInitial extends GetCurrentZikrState {}

final class GetCurrentZikrLoading extends GetCurrentZikrState {}

final class GetCurrentZikrLoaded extends GetCurrentZikrState {
  final int zikrId;
  GetCurrentZikrLoaded({required this.zikrId});
}

final class GetCurrentZikrError extends GetCurrentZikrState {}
