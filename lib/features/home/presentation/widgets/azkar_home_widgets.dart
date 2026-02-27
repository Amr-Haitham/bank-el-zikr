import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:flutter/material.dart';

import 'rectangular_zikr_home_card.dart';

class AzkarHomeWidgets extends StatelessWidget {
  const AzkarHomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RectangularZikrHomeCard(
            title: 'أذكار المساء',
            icon: Icons.nightlight_round,
            iconBackgroundColor: const Color(0xFFEEEEFF),
            iconColor: const Color(0xFF5856D6),
            onTap: () => AutoRouter.of(context).push(const NightAzkarRoute()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RectangularZikrHomeCard(
            title: 'أذكار الصباح',
            icon: Icons.wb_sunny_outlined,
            iconBackgroundColor: const Color(0xFFFFF3E0),
            iconColor: const Color(0xFFFF9500),
            isCompleted: true,
            onTap: () =>
                AutoRouter.of(context).push(const MorningAzkarRoute()),
          ),
        ),
      ],
    );
  }
}
