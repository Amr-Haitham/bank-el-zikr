import 'package:bank_el_ziker/core/layers/presentation/widgets/zikr_share_sheet.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class AdhkarListItemCard extends StatelessWidget {
  const AdhkarListItemCard({
    super.key,
    required this.index,
    required this.zikr,
    required this.reps,
    required this.onTap,
    required this.onComplete,
  });

  final int index;
  final ZikrEntity zikr;
  final int reps;
  final VoidCallback onTap;

  /// Instantly marks this zikr as fully completed, skipping the remaining
  /// taps — only offered in the list view, not the single-zikr view.
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isCompleted = reps >= zikr.count;
    final progress =
        zikr.count == 0 ? 0.0 : (reps / zikr.count).clamp(0.0, 1.0);
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final secondaryTextColor = Theme.of(context).textTheme.bodySmall!.color!;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.content,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => ZikrShareSheet.show(
                    context,
                    content: zikr.content,
                    translation: isEnglish ? zikr.contentEn : null,
                  ),
                  child: Icon(Icons.ios_share,
                      size: 16, color: secondaryTextColor),
                ),
                const SizedBox(width: 10),
                Text(
                  formatNumber(context, index + 1),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.bodySmall!.color!,
                  ),
                ),
              ],
            ),
            if (isEnglish && zikr.contentTransliteration != null) ...[
              const SizedBox(height: 8),
              Text(
                zikr.contentTransliteration!,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
            if (isEnglish && zikr.contentEn != null) ...[
              const SizedBox(height: 6),
              Text(
                zikr.contentEn!,
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 13, color: secondaryTextColor),
              ),
            ],
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
                      children: [
                        Text(
                          AppLocalizations.of(context).completedLabel,
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
                    children: [
                      Text(
                        AppLocalizations.of(context).tapToCount,
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
                    color: Theme.of(context).textTheme.bodySmall!.color!,
                  ),
                ),
              ],
            ),
            if (!isCompleted) ...[
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onComplete,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff34C759).withValues(alpha: 0.4),
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).markCompleted,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff34C759),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.check_circle_outline,
                          size: 15, color: Color(0xff34C759)),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
