import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/daily_activity_log_cubit.dart';
import 'package:bank_el_ziker/core/utils/haptics.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/adhkar_reading_cubit.dart';
import '../widgets/adhkar_list_item_card.dart';
import '../widgets/adhkar_reading_header.dart';
import '../widgets/adhkar_single_card_view.dart';
import '../widgets/adhkar_view_mode_toggle.dart';

class MorningOrNightAzkarScreen extends StatefulWidget {
  const MorningOrNightAzkarScreen({super.key, required this.isMorning});
  final bool isMorning;

  @override
  State<MorningOrNightAzkarScreen> createState() =>
      _MorningOrNightAzkarScreenState();
}

class _MorningOrNightAzkarScreenState extends State<MorningOrNightAzkarScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isMorning) {
      context.read<MorningNightAzkarCubit>().loadMorningAzkar();
    } else {
      context.read<MorningNightAzkarCubit>().loadNightAzkar();
    }
  }

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
          child: BlocBuilder<MorningNightAzkarCubit,
              RequestState<List<MorningNightZikrEntity>>>(
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
                    isMorning: widget.isMorning,
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
  const _AdhkarReadingBody({required this.azkar, required this.isMorning});

  final List<MorningNightZikrEntity> azkar;
  final bool isMorning;

  @override
  State<_AdhkarReadingBody> createState() => _AdhkarReadingBodyState();
}

class _AdhkarReadingBodyState extends State<_AdhkarReadingBody> {
  late final AdhkarReadingCubit _readingCubit;

  String get _category => widget.isMorning ? 'morning' : 'evening';

  @override
  void initState() {
    super.initState();

    final savedReps =
        context.read<AdhkarProgressCubit>().state[_category]?.repsByZikrId ??
            const {};

    _readingCubit = AdhkarReadingCubit(
      azkar: widget.azkar,
      onProgress: _onProgress,
      initialReps: savedReps,
    );

    final firstUnfinishedIndex = widget.azkar
        .indexWhere((zikr) => (savedReps[zikr.id] ?? 0) < zikr.count);
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
    context.read<AdhkarProgressCubit>().saveProgress(
          AdhkarProgressEntity(
            category: _category,
            lastReadAt: DateTime.now(),
            completedCount: completedCount,
            totalCount: totalCount,
            repsByZikrId: _readingCubit.state.repsByZikrId,
          ),
        );
    if (completedCount >= totalCount) {
      context.read<DailyActivityLogCubit>().markAdhkarCompleted(_category);

      final isVibrating = context
              .read<SettingsCubit>()
              .state
              .whenOrNull(success: (s) => s.isVibrating) ??
          true;
      if (isVibrating) {
        // Distinct multi-pulse pattern — marks finishing the *whole*
        // morning/evening adhkar list, not just one zikr.
        vibrateCelebration();
      }
    }
  }

  void _handleIncrement(MorningNightZikrEntity zikr) {
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
                title: widget.isMorning
                    ? AppLocalizations.of(context).morningAdhkar
                    : AppLocalizations.of(context).eveningAdhkar,
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
          reps: readingState.repsByZikrId[zikr.id] ?? 0,
          onTap: () => _handleIncrement(zikr),
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
        isMorning: widget.isMorning,
        reps: readingState.repsByZikrId[zikr.id] ?? 0,
        onTap: () => _handleIncrement(zikr),
      ),
    );
  }
}
