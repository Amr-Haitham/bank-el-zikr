import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/reading_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/reading_progress_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/day_record_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/increment_balance.dart';
import 'package:bank_el_ziker/core/utils/haptics.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/adhkar_reading_cubit.dart';
import '../widgets/adhkar_list_item_card.dart';
import '../widgets/adhkar_reading_header.dart';
import '../widgets/adhkar_single_card_view.dart';
import '../widgets/adhkar_view_mode_toggle.dart';

/// Generic zikr-reading screen used by every category on the Adhkar List —
/// morning, evening, sleep, ruqyah, after-prayer, and every other situational
/// category. The screen itself doesn't care where the data comes from; a
/// [RequestCubit]<List<ZikrEntity>>> ([ZikrCategoryCubit]) must already be
/// provided above it in the widget tree.
class ZikrCategoryScreen extends StatefulWidget {
  const ZikrCategoryScreen({
    super.key,
    required this.category,
    required this.title,
  });

  /// Progress-tracking / data-filtering key, e.g. 'morning', 'evening',
  /// 'sleep', 'ruqyah'.
  final String category;
  final String title;

  @override
  State<ZikrCategoryScreen> createState() => _ZikrCategoryScreenState();
}

class _ZikrCategoryScreenState extends State<ZikrCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              left: ConstantValues.appHorizontalPadding,
              right: ConstantValues.appHorizontalPadding),
          child: BlocBuilder<RequestCubit<List<ZikrEntity>>,
              RequestState<List<ZikrEntity>>>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                failure: (f) => Center(
                    child:
                        Text(AppLocalizations.of(context).errorLoadingAdhkar)),
                success: (azkar) {
                  if (azkar.isEmpty) {
                    return Center(
                        child:
                            Text(AppLocalizations.of(context).noAdhkarFound));
                  }
                  return _AdhkarReadingBody(
                    azkar: azkar,
                    category: widget.category,
                    title: widget.title,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AdhkarReadingBody extends StatefulWidget {
  const _AdhkarReadingBody({
    required this.azkar,
    required this.category,
    required this.title,
  });

  final List<ZikrEntity> azkar;
  final String category;
  final String title;

  @override
  State<_AdhkarReadingBody> createState() => _AdhkarReadingBodyState();
}

class _AdhkarReadingBodyState extends State<_AdhkarReadingBody> {
  late final AdhkarReadingCubit _readingCubit;

  @override
  void initState() {
    super.initState();

    final savedReps = context
            .read<ReadingProgressCubit>()
            .state
            .whenOrNull(success: (progress) => progress[widget.category])
            ?.repsByZikrKey ??
        const {};

    _readingCubit = AdhkarReadingCubit(
      azkar: widget.azkar,
      onProgress: _onProgress,
      incrementBalance: getService<IncrementBalance>(),
      initialReps: savedReps,
    );

    final firstUnfinishedIndex = widget.azkar
        .indexWhere((zikr) => (savedReps[zikr.key] ?? 0) < zikr.count);
    if (firstUnfinishedIndex > 0) {
      _readingCubit.setPage(firstUnfinishedIndex);
    }
  }

  @override
  void dispose() {
    _readingCubit.close();
    super.dispose();
  }

  void _goToPage(int page) {
    if (page < 0 || page >= widget.azkar.length) return;
    _readingCubit.setPage(page);
  }

  void _handleSwipe(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity == 0) return;
    // RTL reading order: a right-to-left drag (negative velocity) moves
    // forward to the next zikr; a left-to-right drag goes back.
    if (velocity < 0) {
      _goToPage(_readingCubit.state.currentPage + 1);
    } else {
      _goToPage(_readingCubit.state.currentPage - 1);
    }
  }

  void _onProgress(int completedCount, int totalCount) {
    context.read<ReadingProgressCubit>().saveProgress(
          ReadingProgressEntity(
            category: widget.category,
            date: DateTime.now(),
            lastReadAt: DateTime.now(),
            completedCount: completedCount,
            totalCount: totalCount,
            repsByZikrKey: _readingCubit.state.repsByZikrKey,
          ),
        );
    if (completedCount >= totalCount) {
      context.read<DayRecordCubit>().markCategoryCompleted(widget.category);

      final isVibrating = context
              .read<SettingsCubit>()
              .state
              .whenOrNull(success: (s) => s.isVibrating) ??
          true;
      if (isVibrating) {
        // Distinct multi-pulse pattern — marks finishing the *whole*
        // adhkar list, not just one zikr.
        vibrateCelebration();
      }
    }
  }

  void _handleIncrement(ZikrEntity zikr) {
    final wasCompleted = _readingCubit.isCompleted(zikr);

    if (wasCompleted) {
      // Already finished this zikr — tapping again just moves on.
      if (_readingCubit.state.viewMode == AdhkarViewMode.single) {
        _goToPage(_readingCubit.state.currentPage + 1);
      }
      return;
    }

    _readingCubit.incrementZikr(zikr);
    final isNowCompleted = _readingCubit.isCompleted(zikr);

    if (isNowCompleted) {
      final isVibrating = context
              .read<SettingsCubit>()
              .state
              .whenOrNull(success: (s) => s.isVibrating) ??
          true;
      if (isVibrating) {
        vibrateOnce();
      }

      if (_readingCubit.state.viewMode == AdhkarViewMode.single) {
        _goToPage(_readingCubit.state.currentPage + 1);
      }
    }
  }

  void _handleComplete(ZikrEntity zikr) {
    if (_readingCubit.isCompleted(zikr)) return;

    _readingCubit.completeZikr(zikr);

    final isVibrating = context
            .read<SettingsCubit>()
            .state
            .whenOrNull(success: (s) => s.isVibrating) ??
        true;
    if (isVibrating) {
      vibrateOnce();
    }

    if (_readingCubit.state.viewMode == AdhkarViewMode.single) {
      _goToPage(_readingCubit.state.currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _readingCubit,
      child: BlocBuilder<AdhkarReadingCubit, AdhkarReadingState>(
        builder: (context, readingState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AdhkarReadingHeader(
                title: widget.title,
                completedCount: _readingCubit.completedItemsCount,
                totalCount: widget.azkar.length,
                onBack: () => AutoRouter.of(context).maybePop(),
              ),
              const SizedBox(height: 16),
              AdhkarViewModeToggle(
                viewMode: readingState.viewMode,
                onChanged: (mode) => _readingCubit.setViewMode(mode),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: readingState.viewMode == AdhkarViewMode.list
                    ? _buildListView(readingState)
                    : _buildSingleView(readingState),
              ),
              const SizedBox(height: ConstantValues.appBottomPadding),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListView(AdhkarReadingState readingState) {
    return ListView.separated(
      itemCount: widget.azkar.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final zikr = widget.azkar[index];
        return AdhkarListItemCard(
          index: index,
          zikr: zikr,
          reps: readingState.repsByZikrKey[zikr.key] ?? 0,
          onTap: () => _handleIncrement(zikr),
          onComplete: () => _handleComplete(zikr),
        );
      },
    );
  }

  Widget _buildSingleView(AdhkarReadingState readingState) {
    final zikr = widget.azkar[readingState.currentPage];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: _handleSwipe,
      child: AdhkarSingleCardView(
        zikr: zikr,
        reps: readingState.repsByZikrKey[zikr.key] ?? 0,
        onTap: () => _handleIncrement(zikr),
        onComplete: () => _handleComplete(zikr),
      ),
    );
  }
}
