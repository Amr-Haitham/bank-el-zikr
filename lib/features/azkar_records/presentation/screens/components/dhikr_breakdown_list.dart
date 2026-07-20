import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class DhikrBreakdownRow {
  final String title;
  final int weekCount;
  final int monthCount;

  const DhikrBreakdownRow({
    required this.title,
    required this.weekCount,
    required this.monthCount,
  });
}

class DhikrBreakdownList extends StatelessWidget {
  const DhikrBreakdownList({
    super.key,
    required this.allAzkar,
    required this.weekTotals,
    required this.monthTotals,
  });

  final List<ZikrEntity> allAzkar;
  final Map<int, int> weekTotals;
  final Map<int, int> monthTotals;

  @override
  Widget build(BuildContext context) {
    final rows = allAzkar
        .where((zikr) => (monthTotals[zikr.id] ?? 0) > 0)
        .map((zikr) => DhikrBreakdownRow(
              title: zikr.content,
              weekCount: weekTotals[zikr.id] ?? 0,
              monthCount: monthTotals[zikr.id] ?? 0,
            ))
        .toList()
      ..sort((a, b) => b.monthCount.compareTo(a.monthCount));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).dhikrBreakdown,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  _headerLabel(context, AppLocalizations.of(context).weekLabel),
                  const SizedBox(width: 16),
                  _headerLabel(
                      context, AppLocalizations.of(context).monthLabel),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (rows.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                AppLocalizations.of(context).noDhikrRecorded,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.5),
                ),
              ),
            )
          else
            for (final row in rows) ...[
              _breakdownRow(context, row),
              const SizedBox(height: 14),
            ],
        ],
      ),
    );
  }

  Widget _headerLabel(BuildContext context, String label) {
    return SizedBox(
      width: 40,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color: Theme.of(context)
              .textTheme
              .bodySmall!
              .color!
              .withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _breakdownRow(BuildContext context, DhikrBreakdownRow row) {
    final progress = row.monthCount == 0
        ? 0.0
        : (row.weekCount / row.monthCount).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                formatNumber(context, row.weekCount),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Text(
                formatNumber(context, row.monthCount),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                row.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.08),
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
