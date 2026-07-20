import 'package:bank_el_ziker/features/azkar_records/presentation/screens/components/category_streak_ring.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryStreakRingRow extends StatelessWidget {
  const CategoryStreakRingRow({
    super.key,
    required this.eveningCurrentStreak,
    required this.morningCurrentStreak,
  });

  final int eveningCurrentStreak;
  final int morningCurrentStreak;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CategoryStreakRing(
            title: AppLocalizations.of(context).eveningAdhkar,
            currentStreak: eveningCurrentStreak,
            color: const Color(0xff6C63FF),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CategoryStreakRing(
            title: AppLocalizations.of(context).morningAdhkar,
            currentStreak: morningCurrentStreak,
            color: const Color(0xffFB8C3C),
          ),
        ),
      ],
    );
  }
}
