import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/reading_progress.dart';
import '../../domain/repositories/reading_progress_repository.dart';
import '../datasources/reading_progress_local_datasource.dart';
import '../models/reading_progress_mapper.dart';

class ReadingProgressRepositoryImpl implements ReadingProgressRepository {
  final ReadingProgressLocalDataSource localDataSource;

  ReadingProgressRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<Map<String, ReadingProgressEntity>>>
      getAllProgress() async {
    return safeAwait(() async {
      final raw = await localDataSource.getAllProgress();
      return raw.map((category, model) =>
          MapEntry(category, ReadingProgressMapper.toEntity(model)));
    });
  }

  @override
  Future<RequestResult<void>> saveProgress(
      ReadingProgressEntity progress) async {
    return safeAwait(() async {
      await localDataSource.saveProgress(ReadingProgressMapper.toModel(
        progress.copyWith(date: DateTime.now()),
      ));
    });
  }
}
