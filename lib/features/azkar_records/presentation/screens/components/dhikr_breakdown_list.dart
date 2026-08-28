import 'package:bank_el_ziker/core/extensions/context.dart';
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
        color: context.theme.cardColor,
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
                  style: context.textTheme.bodyMedium!
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
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.textTheme.bodySmall!.color!
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.labelSmall!.copyWith(
          color: context.textTheme.bodySmall!.color!.withValues(alpha: 0.5),
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
            color: context.textTheme.bodySmall!.color!.withValues(alpha: 0.1),
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
                  style: context.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                if (row.transliteration != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    row.transliteration!,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                      color: context.colors.primary,
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
                    style: context.textTheme.labelMedium!.copyWith(
                      color: context.textTheme.bodySmall!.color!
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
            background: context.colors.primary.withValues(alpha: 0.12),
            color: context.colors.primary,
          ),
          const SizedBox(width: 8),
          _countChip(
            context,
            formatNumber(context, row.monthCount),
            background:
                context.textTheme.bodySmall!.color!.withValues(alpha: 0.08),
            color: context.textTheme.bodyLarge!.color!,
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }
}
