import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/reading_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_all_reading_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/save_reading_progress.dart';

/// A single, app-wide shared cubit for adhkar category reading progress.
///
/// It's registered as a singleton and provided once at the app root, so the
/// reading screen (which writes) and the Adhkar hub (which reads) always
/// see the same in-memory state instantly, without depending on
/// navigation/router events to know when to refresh.
class ReadingProgressCubit
    extends RequestCubit<Map<String, ReadingProgressEntity>> {
  final GetAllReadingProgress getAllReadingProgress;
  final SaveReadingProgress saveReadingProgressUseCase;

  ReadingProgressCubit({
    required this.getAllReadingProgress,
    required this.saveReadingProgressUseCase,
  }) : super(
          callOnCreate: true,
          request: () => getAllReadingProgress(const NoParams()),
        );

  Future<void> saveProgress(ReadingProgressEntity progress) async {
    final currentState = state;
    if (currentState
        is RequestStateSuccess<Map<String, ReadingProgressEntity>>) {
      modifyState((s) =>
          RequestState.success({...s.data, progress.category: progress}));
    }
    await saveReadingProgressUseCase(progress);
  }
}
