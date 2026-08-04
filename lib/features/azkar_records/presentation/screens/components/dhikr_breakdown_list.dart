import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class DhikrBreakdownRow {
  final String title;
  final String? transliteration;
  final String? translation;
  final int weekCount;
  final int monthCount;

  const DhikrBreakdownRow({
    required this.title,
    required this.weekCount,
    required this.monthCount,
    this.transliteration,
    this.translation,
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
  final Map<String, int> weekTotals;
  final Map<String, int> monthTotals;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final rows = allAzkar
        .where((zikr) => (monthTotals[zikr.key] ?? 0) > 0)
        .map((zikr) => DhikrBreakdownRow(
              title: zikr.content,
              transliteration: isEnglish ? zikr.contentTransliteration : null,
              translation: isEnglish ? zikr.contentEn : null,
              weekCount: weekTotals[zikr.key] ?? 0,
              monthCount: monthTotals[zikr.key] ?? 0,
            ))
        .toList()
      ..sort((a, b) => b.monthCount.compareTo(a.monthCount));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).dhikrBreakdown,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  _headerLabel(context, AppLocalizations.of(context).weekLabel),
                  const SizedBox(width: 8),
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
            for (final row in rows) _breakdownRow(context, row),
        ],
      ),
    );
  }

  Widget _headerLabel(BuildContext context, String label) {
    return SizedBox(
      width: 44,
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  row.title,
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                if (row.transliteration != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    row.transliteration!,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
                if (row.translation != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    row.translation!,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          _countChip(
            context,
            formatNumber(context, row.weekCount),
            background:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          _countChip(
            context,
            formatNumber(context, row.monthCount),
            background: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.08),
            color: Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ],
      ),
    );
  }

  Widget _countChip(
    BuildContext context,
    String text, {
    required Color background,
    required Color color,
  }) {
    return Container(
      width: 44,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }
}
