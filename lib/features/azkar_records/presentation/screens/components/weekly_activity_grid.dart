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

  static const _morningColor = Color(0xffFF9F43);
  static const _eveningColor = Color(0xff5E5CE6);
  static const _zikrColor = Color(0xff34C759);

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
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
              return Column(
                children: [
                  _dot(day.hasMorning ? _morningColor : null),
                  const SizedBox(height: 6),
                  _dot(day.hasEvening ? _eveningColor : null),
                  const SizedBox(height: 6),
                  _dot(day.hasZikr ? _zikrColor : null),
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

  Widget _dot(Color? color) {
    return Container(
      width: 22,
      height: 10,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
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
