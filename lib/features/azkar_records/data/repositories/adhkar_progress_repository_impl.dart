import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/adhkar_progress.dart';
import '../../domain/repositories/adhkar_progress_repository.dart';
import '../datasources/adhkar_progress_local_datasource.dart';

class AdhkarProgressRepositoryImpl implements AdhkarProgressRepository {
  final AdhkarProgressLocalDataSource localDataSource;

  AdhkarProgressRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<Map<String, AdhkarProgressEntity>>>
      getAllProgress() async {
    return safeAwait(() async {
      final raw = await localDataSource.getAllProgress();
      return raw.map((category, value) {
        final rawReps = Map<String, dynamic>.from(value['repsByZikrId'] ?? {});
        return MapEntry(
          category,
          AdhkarProgressEntity(
            category: category,
            lastReadAt: value['lastReadAt'] != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    value['lastReadAt'] as int)
                : null,
            completedCount: value['completedCount'] as int? ?? 0,
            totalCount: value['totalCount'] as int? ?? 0,
            repsByZikrId: rawReps.map((zikrIdString, reps) =>
                MapEntry(int.parse(zikrIdString), reps as int)),
          ),
        );
      });
    });
  }

  @override
  Future<RequestResult<void>> saveProgress(
      AdhkarProgressEntity progress) async {
    return safeAwait(() async {
      await localDataSource.saveProgress(
        category: progress.category,
        lastReadAt: progress.lastReadAt ?? DateTime.now(),
        completedCount: progress.completedCount,
        totalCount: progress.totalCount,
        repsByZikrId: progress.repsByZikrId,
      );
    });
  }
}
