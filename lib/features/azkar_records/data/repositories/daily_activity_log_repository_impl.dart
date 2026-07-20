import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/daily_activity_entry.dart';
import '../../domain/repositories/daily_activity_log_repository.dart';
import '../datasources/daily_activity_log_local_datasource.dart';

class DailyActivityLogRepositoryImpl implements DailyActivityLogRepository {
  final DailyActivityLogLocalDataSource localDataSource;

  DailyActivityLogRepositoryImpl({required this.localDataSource});

  DailyActivityEntry _fromRaw(String key, Map<String, dynamic> raw) {
    final parts = key.split('-');
    final date = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    final rawZikrCounts = Map<String, dynamic>.from(raw['zikrCounts'] ?? {});
    final zikrCounts = rawZikrCounts.map((zikrIdString, count) =>
        MapEntry(int.parse(zikrIdString), count as int));
    return DailyActivityEntry(
      date: date,
      zikrCounts: zikrCounts,
      morningCompleted: raw['morningCompleted'] as bool? ?? false,
      eveningCompleted: raw['eveningCompleted'] as bool? ?? false,
    );
  }

  @override
  Future<RequestResult<List<DailyActivityEntry>>> getAll() async {
    return safeAwait(() async {
      final raw = await localDataSource.getAll();
      final entries = raw.entries.map((e) => _fromRaw(e.key, e.value)).toList();
      entries.sort((a, b) => b.date.compareTo(a.date));
      return entries;
    });
  }

  @override
  Future<RequestResult<void>> logZikrIncrement(int zikrId) async {
    return safeAwait(() async {
      await localDataSource.logZikrIncrement(
          zikrId: zikrId, date: DateTime.now());
    });
  }

  @override
  Future<RequestResult<void>> markAdhkarCompleted(String category) async {
    return safeAwait(() async {
      await localDataSource.markAdhkarCompleted(
          category: category, date: DateTime.now());
    });
  }
}
