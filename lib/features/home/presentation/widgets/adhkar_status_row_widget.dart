import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:flutter/material.dart';

class AdhkarStatusRowWidget extends StatelessWidget {
  const AdhkarStatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _AdhkarStatusCard(
            icon: Icons.nightlight_round,
            iconColor: const Color(0xff5E5CE6),
            title: "Evening Adhkar",
            status: "Incomplete",
            statusColor: Theme.of(context).textTheme.bodySmall!.color!
                .withValues(alpha: 0.5),
            onTap: () => AutoRouter.of(context).push(const NightAzkarRoute()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _AdhkarStatusCard(
            icon: Icons.wb_sunny_outlined,
            iconColor: const Color(0xffFFB800),
            title: "Morning Adhkar",
            status: "Done",
            statusColor: Theme.of(context).primaryColor,
            onTap: () =>
                AutoRouter.of(context).push(const MorningAzkarRoute()),
          ),
        ),
      ],
    );
  }
}

class _AdhkarStatusCard extends StatelessWidget {
  const _AdhkarStatusCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String status;
  final Color statusColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                Icon(Icons.chevron_right,
                    size: 18,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withValues(alpha: 0.4)),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              status,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
