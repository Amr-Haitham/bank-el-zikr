import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/directional_chevron.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_zikr_record.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class _Streak {
  final int count;
  final DateTime? startDay;
  const _Streak(this.count, this.startDay);
}

class StreakCardWidget extends StatelessWidget {
  const StreakCardWidget({super.key});

  static _Streak _computeStreak(List<DayZikrRecordEntity> dailyRecords) {
    final sorted = [...dailyRecords]
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    int streak = 0;
    DateTime? expectedDay;
    DateTime? startDay;
    for (final day in sorted) {
      final total = day.azkarRecordById.values.fold<int>(0, (s, v) => s + v);
      if (total <= 0) break;

      final dayOnly =
          DateTime(day.dateTime.year, day.dateTime.month, day.dateTime.day);
      expectedDay ??= dayOnly;
      if (dayOnly != expectedDay) break;

      streak++;
      startDay = dayOnly;
      expectedDay = dayOnly.subtract(const Duration(days: 1));
    }
    return _Streak(streak, startDay);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeekAzkarRecordsCubit, RequestState<WeekAzkarRecord>>(
      builder: (context, state) {
        final streak = state.whenOrNull(
              success: (record) => _computeStreak(record.dailyRecords),
            ) ??
            const _Streak(0, null);
        final locale = Localizations.localeOf(context).languageCode;
        final sinceLabel = streak.startDay == null
            ? null
            : AppLocalizations.of(context)
                .streakSince(DateFormat.MMMMd(locale).format(streak.startDay!));
        return GestureDetector(
          onTap: () => AutoTabsRouter.of(context).setActiveIndex(3),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  const Color(0xff1D6B3A),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).streakLabel,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalizations.of(context).dayStreakCount(
                                formatNumber(context, streak.count)),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context).streakDescription,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13),
                          ),
                          if (sinceLabel != null)
                            Text(
                              sinceLabel,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 13),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.local_fire_department,
                          color: Colors.white, size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).viewStats,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const DirectionalChevron(color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
