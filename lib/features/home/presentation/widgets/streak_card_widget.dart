import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_zikr_record.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreakCardWidget extends StatelessWidget {
  const StreakCardWidget({super.key});

  static int _computeStreak(List<DayZikrRecordEntity> dailyRecords) {
    final sorted = [...dailyRecords]
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    int streak = 0;
    DateTime? expectedDay;
    for (final day in sorted) {
      final total = day.azkarRecordById.values.fold<int>(0, (s, v) => s + v);
      if (total <= 0) break;

      final dayOnly =
          DateTime(day.dateTime.year, day.dateTime.month, day.dateTime.day);
      expectedDay ??= dayOnly;
      if (dayOnly != expectedDay) break;

      streak++;
      expectedDay = dayOnly.subtract(const Duration(days: 1));
    }
    return streak;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeekAzkarRecordsCubit, RequestState<WeekAzkarRecord>>(
      builder: (context, state) {
        final streak = state.whenOrNull(
              success: (record) => _computeStreak(record.dailyRecords),
            ) ??
            0;
        return Container(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Streak",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$streak day streak",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "You've kept up your daily adhkar without\nmissing a day",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => AutoTabsRouter.of(context).setActiveIndex(3),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "View stats",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.chevron_right,
                              color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.local_fire_department,
                    color: Colors.white, size: 24),
              ),
            ],
          ),
        );
      },
    );
  }
}
