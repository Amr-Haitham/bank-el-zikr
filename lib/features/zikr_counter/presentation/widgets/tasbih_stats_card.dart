import 'package:arabic_numbers/arabic_numbers.dart';
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
              label: "Balance",
              value: ArabicNumbers().convert(balance),
              valueColor: Theme.of(context).primaryColor,
            ),
          ),
          _divider(context),
          Expanded(
            child: _StatColumn(
              label: "Laps",
              value: ArabicNumbers().convert(laps),
              valueColor: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          _divider(context),
          Expanded(
            child: _StatColumn(
              label: "Goal",
              value: goal != null ? ArabicNumbers().convert(goal!) : "-",
              valueColor: const Color(0xffFFB800),
              onEdit: onEditGoal,
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
      color: Theme.of(context).textTheme.bodySmall!.color!.withValues(alpha: 0.15),
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
