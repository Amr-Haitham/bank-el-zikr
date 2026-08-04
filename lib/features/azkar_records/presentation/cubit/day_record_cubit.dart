import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_record.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_all_day_records.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/log_zikr_increment.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/mark_category_completed.dart';

/// A single, app-wide shared cubit holding the full (unpruned) history of
/// daily spiritual activity, used to compute real streaks / longest streaks
/// / month-year charts on the Journey screen.
class DayRecordCubit extends RequestCubit<List<DayRecordEntity>> {
  final GetAllDayRecords getAllDayRecords;
  final LogZikrIncrement logZikrIncrementUseCase;
  final MarkCategoryCompleted markCategoryCompletedUseCase;

  DayRecordCubit({
    required this.getAllDayRecords,
    required this.logZikrIncrementUseCase,
    required this.markCategoryCompletedUseCase,
  }) : super(
          callOnCreate: true,
          request: () => getAllDayRecords(const NoParams()),
        );

  Future<void> logZikrIncrement(String zikrKey) async {
    await logZikrIncrementUseCase(zikrKey);
    await reExecutePastRequest();
  }

  Future<void> markCategoryCompleted(String category) async {
    await markCategoryCompletedUseCase(category);
    await reExecutePastRequest();
  }
}
