import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/increment_balance.dart';

enum AdhkarViewMode { list, single }

class AdhkarReadingState extends Equatable {
  final AdhkarViewMode viewMode;
  final int currentPage;
  final Map<String, int> repsByZikrKey;

  const AdhkarReadingState({
    required this.viewMode,
    required this.currentPage,
    required this.repsByZikrKey,
  });

  AdhkarReadingState copyWith({
    AdhkarViewMode? viewMode,
    int? currentPage,
    Map<String, int>? repsByZikrKey,
  }) {
    return AdhkarReadingState(
      viewMode: viewMode ?? this.viewMode,
      currentPage: currentPage ?? this.currentPage,
      repsByZikrKey: repsByZikrKey ?? this.repsByZikrKey,
    );
  }

  @override
  List<Object?> get props => [viewMode, currentPage, repsByZikrKey];
}

/// Pure, per-session reading state for a morning/night adhkar list: which
/// view mode is active, which page is showing, and how many repetitions of
/// each zikr have been tapped so far. Has no knowledge of persistence —
/// callers observe [onProgress] to push completion data to the app's real
/// progress-tracking cubits. Every tap also increments the shared account
/// balance, the same +1-per-tap the tasbih counter uses.
class AdhkarReadingCubit extends Cubit<AdhkarReadingState> {
  final List<ZikrEntity> azkar;
  final void Function(int completedCount, int totalCount) onProgress;
  final IncrementBalance incrementBalance;

  AdhkarReadingCubit({
    required this.azkar,
    required this.onProgress,
    required this.incrementBalance,
    Map<String, int> initialReps = const {},
  }) : super(AdhkarReadingState(
          viewMode: AdhkarViewMode.list,
          currentPage: 0,
          repsByZikrKey: initialReps,
        ));

  int repsFor(String zikrKey) => state.repsByZikrKey[zikrKey] ?? 0;

  bool isCompleted(ZikrEntity zikr) => repsFor(zikr.key) >= zikr.count;

  int get completedItemsCount => azkar.where(isCompleted).length;

  void setViewMode(AdhkarViewMode mode) => emit(state.copyWith(viewMode: mode));

  void setPage(int page) => emit(state.copyWith(currentPage: page));

  void incrementZikr(ZikrEntity zikr) {
    final current = repsFor(zikr.key);
    if (current >= zikr.count) return;

    final updatedReps = Map<String, int>.from(state.repsByZikrKey);
    updatedReps[zikr.key] = current + 1;
    emit(state.copyWith(repsByZikrKey: updatedReps));
    incrementBalance(const NoParams());

    final completedCount =
        azkar.where((z) => (updatedReps[z.key] ?? 0) >= z.count).length;
    onProgress(completedCount, azkar.length);
  }

  void completeZikr(ZikrEntity zikr) {
    if (isCompleted(zikr)) return;

    final updatedReps = Map<String, int>.from(state.repsByZikrKey);
    updatedReps[zikr.key] = zikr.count;
    emit(state.copyWith(repsByZikrKey: updatedReps));
    incrementBalance(const NoParams());

    final completedCount =
        azkar.where((z) => (updatedReps[z.key] ?? 0) >= z.count).length;
    onProgress(completedCount, azkar.length);
  }
}
