import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';

enum AdhkarViewMode { list, single }

class AdhkarReadingState extends Equatable {
  final AdhkarViewMode viewMode;
  final int currentPage;
  final Map<int, int> repsByZikrId;

  const AdhkarReadingState({
    required this.viewMode,
    required this.currentPage,
    required this.repsByZikrId,
  });

  AdhkarReadingState copyWith({
    AdhkarViewMode? viewMode,
    int? currentPage,
    Map<int, int>? repsByZikrId,
  }) {
    return AdhkarReadingState(
      viewMode: viewMode ?? this.viewMode,
      currentPage: currentPage ?? this.currentPage,
      repsByZikrId: repsByZikrId ?? this.repsByZikrId,
    );
  }

  @override
  List<Object?> get props => [viewMode, currentPage, repsByZikrId];
}

/// Pure, per-session reading state for a morning/night adhkar list: which
/// view mode is active, which page is showing, and how many repetitions of
/// each zikr have been tapped so far. Has no knowledge of persistence —
/// callers observe [onProgress] to push completion data to the app's real
/// progress-tracking cubits.
class AdhkarReadingCubit extends Cubit<AdhkarReadingState> {
  final List<MorningNightZikrEntity> azkar;
  final void Function(int completedCount, int totalCount) onProgress;

  AdhkarReadingCubit({
    required this.azkar,
    required this.onProgress,
    Map<int, int> initialReps = const {},
  }) : super(AdhkarReadingState(
          viewMode: AdhkarViewMode.single,
          currentPage: 0,
          repsByZikrId: initialReps,
        ));

  int repsFor(int zikrId) => state.repsByZikrId[zikrId] ?? 0;

  bool isCompleted(MorningNightZikrEntity zikr) =>
      repsFor(zikr.id) >= zikr.count;

  int get completedItemsCount => azkar.where(isCompleted).length;

  void setViewMode(AdhkarViewMode mode) => emit(state.copyWith(viewMode: mode));

  void setPage(int page) => emit(state.copyWith(currentPage: page));

  void incrementZikr(MorningNightZikrEntity zikr) {
    final current = repsFor(zikr.id);
    if (current >= zikr.count) return;

    final updatedReps = Map<int, int>.from(state.repsByZikrId);
    updatedReps[zikr.id] = current + 1;
    emit(state.copyWith(repsByZikrId: updatedReps));

    final completedCount =
        azkar.where((z) => (updatedReps[z.id] ?? 0) >= z.count).length;
    onProgress(completedCount, azkar.length);
  }
}
