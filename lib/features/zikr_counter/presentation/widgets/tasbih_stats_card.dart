import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class TasbihStatsCard extends StatelessWidget {
  const TasbihStatsCard({
    super.key,
    required this.balance,
    required this.laps,
    required this.goal,
    required this.onEditGoal,
  });

  final int balance;
  final int laps;
  final int? goal;
  final VoidCallback onEditGoal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatColumn(
              label: AppLocalizations.of(context).goalLabel,
              value: goal != null ? formatNumber(context, goal!) : "-",
              valueColor: Theme.of(context).colorScheme.secondary,
              onEdit: onEditGoal,
            ),
          ),
          _divider(context),
          Expanded(
            child: _StatColumn(
              label: AppLocalizations.of(context).lapsLabel,
              value: formatNumber(context, laps),
              valueColor: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          _divider(context),
          Expanded(
            child: _StatColumn(
              label: AppLocalizations.of(context).balanceLabel,
              value: formatNumber(context, balance),
              valueColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      width: 1,
      height: 34,
      color:
          Theme.of(context).textTheme.bodySmall!.color!.withValues(alpha: 0.15),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.label,
    required this.value,
    required this.valueColor,
    this.onEdit,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .color!
                    .withValues(alpha: 0.6),
              ),
            ),
            if (onEdit != null) ...[
              const SizedBox(width: 4),
              Icon(Icons.edit,
                  size: 14,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.6)),
            ],
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: valueColor,
          ),
        ),
      ],
    );

    if (onEdit == null) return column;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: column,
      ),
    );
  }
}
