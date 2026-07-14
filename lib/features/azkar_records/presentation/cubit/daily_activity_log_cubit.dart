import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/daily_activity_entry.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_daily_activity_log.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/log_zikr_increment.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/mark_adhkar_completed.dart';

/// A single, app-wide shared cubit holding the full (unpruned) history of
/// daily spiritual activity, used to compute real streaks / longest streaks
/// / month-year charts on the Journey screen.
class DailyActivityLogCubit extends Cubit<List<DailyActivityEntry>> {
  final GetDailyActivityLog getDailyActivityLog;
  final LogZikrIncrement logZikrIncrementUseCase;
  final MarkAdhkarCompleted markAdhkarCompletedUseCase;

  DailyActivityLogCubit({
    required this.getDailyActivityLog,
    required this.logZikrIncrementUseCase,
    required this.markAdhkarCompletedUseCase,
  }) : super(const []) {
    _load();
  }

  Future<void> _load() async {
    final result = await getDailyActivityLog(const NoParams());
    result.fold((_) {}, (entries) => emit(entries));
  }

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  DailyActivityEntry _findOrCreateToday() {
    final today = _today;
    return state.firstWhere(
      (e) => e.date == today,
      orElse: () => DailyActivityEntry(
        date: today,
        zikrCounts: const {},
        morningCompleted: false,
        eveningCompleted: false,
      ),
    );
  }

  void _emitWithToday(DailyActivityEntry updatedToday) {
    final today = _today;
    final without = state.where((e) => e.date != today).toList();
    emit([updatedToday, ...without]..sort((a, b) => b.date.compareTo(a.date)));
  }

  Future<void> logZikrIncrement(int zikrId) async {
    final todayEntry = _findOrCreateToday();
    final zikrCounts = Map<int, int>.from(todayEntry.zikrCounts);
    zikrCounts[zikrId] = (zikrCounts[zikrId] ?? 0) + 1;
    _emitWithToday(todayEntry.copyWith(zikrCounts: zikrCounts));
    await logZikrIncrementUseCase(zikrId);
  }

  Future<void> markAdhkarCompleted(String category) async {
    final todayEntry = _findOrCreateToday();
    _emitWithToday(category == 'morning'
        ? todayEntry.copyWith(morningCompleted: true)
        : todayEntry.copyWith(eveningCompleted: true));
    await markAdhkarCompletedUseCase(category);
  }
}
