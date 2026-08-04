import 'package:bank_el_ziker/features/azkar_records/presentation/screens/components/category_streak_ring.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryStreakRingRow extends StatelessWidget {
  const CategoryStreakRingRow({
    super.key,
    required this.eveningCurrentStreak,
    required this.eveningLongestStreak,
    required this.morningCurrentStreak,
    required this.morningLongestStreak,
  });

  final int eveningCurrentStreak;
  final int eveningLongestStreak;
  final int morningCurrentStreak;
  final int morningLongestStreak;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CategoryStreakRing(
            title: AppLocalizations.of(context).morningAdhkar,
            currentStreak: morningCurrentStreak,
            longestStreak: morningLongestStreak,
            color: const Color(0xffFB8C3C),
            icon: Icons.wb_sunny_rounded,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CategoryStreakRing(
            title: AppLocalizations.of(context).eveningAdhkar,
            currentStreak: eveningCurrentStreak,
            longestStreak: eveningLongestStreak,
            color: const Color(0xff6C63FF),
            icon: Icons.nightlight_round,
          ),
        ),
      ],
    );
  }
}
