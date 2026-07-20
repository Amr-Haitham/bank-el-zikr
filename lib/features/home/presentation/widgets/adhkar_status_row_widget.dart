import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/directional_chevron.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AdhkarStatusRowWidget extends StatelessWidget {
  const AdhkarStatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _AdhkarStatusCard(
            icon: Icons.nightlight_round,
            iconColor: const Color(0xff6C63FF),
            title: l10n.eveningAdhkar,
            status: l10n.incomplete,
            statusColor: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.5),
            onTap: () => AutoRouter.of(context).push(const NightAzkarRoute()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _AdhkarStatusCard(
            icon: Icons.wb_sunny_outlined,
            iconColor: const Color(0xffFB8C3C),
            title: l10n.morningAdhkar,
            status: l10n.done,
            statusColor: Theme.of(context).primaryColor,
            onTap: () => AutoRouter.of(context).push(const MorningAzkarRoute()),
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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
                DirectionalChevron(
                    size: 18,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withValues(alpha: 0.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
