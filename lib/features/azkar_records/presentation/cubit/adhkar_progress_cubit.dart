import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_all_adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/save_adhkar_progress.dart';

/// A single, app-wide shared cubit for adhkar category progress.
///
/// It's registered as a singleton and provided once at the app root, so the
/// morning/night reading screen (which writes) and the Adhkar hub (which
/// reads) always see the same in-memory state instantly, without depending
/// on navigation/router events to know when to refresh.
class AdhkarProgressCubit extends Cubit<Map<String, AdhkarProgressEntity>> {
  final GetAllAdhkarProgress getAllAdhkarProgress;
  final SaveAdhkarProgress saveAdhkarProgressUseCase;

  AdhkarProgressCubit({
    required this.getAllAdhkarProgress,
    required this.saveAdhkarProgressUseCase,
  }) : super(const {}) {
    _load();
  }

  Future<void> _load() async {
    final result = await getAllAdhkarProgress(const NoParams());
    result.fold((_) {}, (progress) => emit(progress));
  }

  Future<void> saveProgress(AdhkarProgressEntity progress) async {
    emit({...state, progress.category: progress});
    await saveAdhkarProgressUseCase(progress);
  }
}
