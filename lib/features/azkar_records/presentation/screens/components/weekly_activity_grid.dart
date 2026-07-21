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

  static const _morningColor = Color(0xffFB8C3C);
  static const _eveningColor = Color(0xff6C63FF);
  static const _zikrColor = Color(0xff34C759);

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  AppLocalizations.of(context)
                      .adhkarOutOf21(formatNumber(context, activeCount)),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context).thisWeek,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days.map((day) {
              final column = Column(
                children: [
                  _cell(day.hasMorning ? _morningColor : null),
                  const SizedBox(height: 6),
                  _cell(day.hasEvening ? _eveningColor : null),
                  const SizedBox(height: 6),
                  _cell(day.hasZikr ? _zikrColor : null),
                  const SizedBox(height: 8),
                  Text(
                    day.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          day.isToday ? FontWeight.w800 : FontWeight.w500,
                      color: day.isToday
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .color!
                              .withValues(alpha: 0.6),
                    ),
                  ),
                ],
              );

              if (!day.isToday) return column;

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
                child: column,
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(context, AppLocalizations.of(context).morningAdhkar,
                  _morningColor),
              const SizedBox(width: 14),
              _legendItem(context, AppLocalizations.of(context).eveningAdhkar,
                  _eveningColor),
              const SizedBox(width: 14),
              _legendItem(
                  context, AppLocalizations.of(context).navTasbih, _zikrColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cell(Color? color) {
    return Container(
      width: 22,
      height: 16,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
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
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
