import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/journey_stats.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class WeeklyActivityGrid extends StatelessWidget {
  const WeeklyActivityGrid({
    super.key,
    required this.days,
    required this.activeCount,
  });

  final List<WeeklyGridDay> days;
  final int activeCount;

  static const _morningColor = morningOrange;
  static const _eveningColor = eveningPurple;
  static const _sleepColor = categorySleepBlue;

  String _weekdayLabel(BuildContext context, int weekday) {
    final l10n = AppLocalizations.of(context);
    return switch (weekday) {
      DateTime.monday => l10n.weekdayMon,
      DateTime.tuesday => l10n.weekdayTue,
      DateTime.wednesday => l10n.weekdayWed,
      DateTime.thursday => l10n.weekdayThu,
      DateTime.friday => l10n.weekdayFri,
      DateTime.saturday => l10n.weekdaySat,
      _ => l10n.weekdaySun,
    };
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  AppLocalizations.of(context)
                      .adhkarOutOf21(formatNumber(context, activeCount)),
                  style: context.textTheme.labelMedium!.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context).thisWeek,
                style: context.textTheme.bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: days.map((day) {
              final cellsColumn = Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: day.isToday
                        ? context.theme.primaryColor
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _cell(day.hasMorning ? _morningColor : null),
                    const SizedBox(height: 3),
                    _cell(day.hasEvening ? _eveningColor : null),
                    const SizedBox(height: 3),
                    _cell(day.hasSleep ? _sleepColor : null),
                  ],
                ),
              );

              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cellsColumn,
                      const SizedBox(height: 8),
                      Text(
                        _weekdayLabel(context, day.date.weekday),
                        style: context.textTheme.labelSmall!.copyWith(
                          fontWeight: day.isToday
                              ? FontWeight.w800
                              : FontWeight.w500,
                          color: day.isToday
                              ? context.theme.primaryColor
                              : context.textTheme.bodySmall!.color!
                                  .withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 14,
            runSpacing: 8,
            children: [
              _legendItem(context, AppLocalizations.of(context).morningAdhkar,
                  _morningColor),
              _legendItem(context, AppLocalizations.of(context).eveningAdhkar,
                  _eveningColor),
              _legendItem(context, AppLocalizations.of(context).sleepAdhkar,
                  _sleepColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cell(Color? color) {
    return Container(
      width: double.infinity,
      height: 24,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _legendItem(BuildContext context, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: context.textTheme.labelSmall!.copyWith(
            color: context.textTheme.bodySmall!.color!
                .withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
