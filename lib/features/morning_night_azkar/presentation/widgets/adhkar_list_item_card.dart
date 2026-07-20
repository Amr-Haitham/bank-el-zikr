import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:flutter/material.dart';

class AdhkarListItemCard extends StatelessWidget {
  const AdhkarListItemCard({
    super.key,
    required this.index,
    required this.zikr,
    required this.reps,
    required this.onTap,
  });

  final int index;
  final MorningNightZikrEntity zikr;
  final int reps;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isCompleted = reps >= zikr.count;
    final progress =
        zikr.count == 0 ? 0.0 : (reps / zikr.count).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: isCompleted ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.content,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formatNumber(context, index + 1),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xff34C759)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                if (isCompleted)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xff34C759).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          AppLocalizations.of(context).completedLabel,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff34C759),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.check_circle,
                            size: 14, color: Color(0xff34C759)),
                      ],
                    ),
                  )
                else
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        AppLocalizations.of(context).tapToCount,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add,
                            size: 15, color: Colors.white),
                      ),
                    ],
                  ),
                Text(
                  "${formatNumber(context, reps)}/${formatNumber(context, zikr.count)}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
