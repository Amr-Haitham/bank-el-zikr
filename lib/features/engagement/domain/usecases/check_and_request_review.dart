import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_record.dart';
import 'package:bank_el_ziker/features/engagement/domain/repositories/rate_prompt_repository.dart';
import 'package:in_app_review/in_app_review.dart';

int totalCompletedSessions(List<DayRecordEntity> dayRecords) {
  return dayRecords.fold<int>(0, (sum, record) {
    var count = sum;
    if (record.morningCompleted) count++;
    if (record.eveningCompleted) count++;
    return count;
  });
}

class CheckAndRequestReview implements UseCase<void, List<DayRecordEntity>> {
  final RatePromptRepository repository;
  final InAppReview inAppReview;

  CheckAndRequestReview(this.repository, {InAppReview? inAppReview})
      : inAppReview = inAppReview ?? InAppReview.instance;

  @override
  Future<RequestResult<void>> call(List<DayRecordEntity> dayRecords) async {
    final stateResult = await repository.getState();
    if (stateResult.isLeft()) {
      return stateResult.fold((failure) => Left(failure), (_) => const Right(null));
    }
    final state = stateResult.fold((_) => null, (state) => state)!;

    final eligible = state.isEligible(
      totalCompletedSessions: totalCompletedSessions(dayRecords),
      now: DateTime.now(),
    );
    if (!eligible) return const Right(null);

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }

    return repository.saveState(
      state.copyWith(
        lastShownAt: DateTime.now(),
        timesShown: state.timesShown + 1,
      ),
    );
  }
}
