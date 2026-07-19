import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/daily_activity_entry.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/journey_stats.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/daily_activity_log_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/category_streak_ring.dart';
import 'components/dhikr_breakdown_list.dart';
import 'components/hasanat_growth_card.dart';
import 'components/journey_streak_card.dart';
import 'components/weekly_activity_grid.dart';

class AccountBalanceScreen extends StatelessWidget {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<DailyActivityLogCubit, List<DailyActivityEntry>>(
          builder: (context, entries) {
            final stats = JourneyStats(entries);

            return ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantValues.appHorizontalPadding),
              children: [
                const SizedBox(height: ConstantValues.appTopPadding),
                Text(
                  AppLocalizations.of(context).mySpiritualJourney,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                JourneyStreakCard(
                  currentStreak: stats.overallCurrentStreak,
                  longestStreak: stats.overallLongestStreak,
                ),
                const SizedBox(height: 16),
                BlocBuilder<CounterCubit, RequestState<CounterStateEntity>>(
                  builder: (context, counterState) {
                    final balance = counterState.whenOrNull(
                          success: (s) => s.accountBalance,
                        ) ??
                        0;
                    return HasanatGrowthCard(
                      stats: stats,
                      totalBalance: balance,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CategoryStreakRing(
                        title: AppLocalizations.of(context).eveningAdhkar,
                        currentStreak: stats.eveningCurrentStreak,
                        color: const Color(0xff5E5CE6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CategoryStreakRing(
                        title: AppLocalizations.of(context).morningAdhkar,
                        currentStreak: stats.morningCurrentStreak,
                        color: const Color(0xffFF9F43),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                WeeklyActivityGrid(
                  days: stats.weeklyGrid,
                  activeCount: stats.activeDaysThisWeek,
                ),
                const SizedBox(height: 16),
                BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
                  builder: (context, azkarState) {
                    final allAzkar =
                        azkarState.whenOrNull(success: (azkar) => azkar) ??
                            const <ZikrEntity>[];
                    return DhikrBreakdownList(
                      allAzkar: allAzkar,
                      weekTotals: stats.zikrTotalsOverLastDays(7),
                      monthTotals: stats.zikrTotalsOverLastDays(30),
                    );
                  },
                ),
                const SizedBox(height: ConstantValues.appBottomPadding),
              ],
            );
          },
        ),
      ),
    );
  }
}
