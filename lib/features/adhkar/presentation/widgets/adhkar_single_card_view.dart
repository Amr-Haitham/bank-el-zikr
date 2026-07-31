import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'adhkar_counter_ring.dart';
import 'zikr_category_icon.dart';

class AdhkarSingleCardView extends StatelessWidget {
  const AdhkarSingleCardView({
    super.key,
    required this.zikr,
    required this.reps,
    required this.onTap,
  });

  final ZikrEntity zikr;
  final int reps;
  final VoidCallback onTap;

  IconData get _icon => zikrCategoryIcon(zikr.category);

  Color get _iconColor {
    switch (zikr.isMorning) {
      case true:
        return morningOrange;
      case false:
        return eveningPurple;
      case null:
        return primaryGreen;
    }
  }

  void _showFavor(BuildContext context, bool isEnglish) {
    final favor = isEnglish && zikr.descriptionEn != null
        ? zikr.descriptionEn!
        : zikr.description;
    if (favor == null || favor.isEmpty) return;
    final source = isEnglish ? (zikr.sourceEn ?? zikr.source) : zikr.source;
    final favorDirection = isEnglish ? TextDirection.ltr : TextDirection.rtl;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).virtueAndSource,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Text(
              favor,
              textAlign: TextAlign.center,
              textDirection: favorDirection,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (source != null && source.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                source,
                textAlign: TextAlign.center,
                textDirection: favorDirection,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final favorText = isEnglish && zikr.descriptionEn != null
        ? zikr.descriptionEn
        : zikr.description;
    final secondaryTextColor = Theme.of(context).textTheme.bodySmall!.color!;
    final shareText =
        isEnglish && zikr.contentEn != null ? zikr.contentEn! : zikr.content;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Icon(_icon, color: _iconColor, size: 28),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              zikr.content,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              minFontSize: 13,
                              maxLines: 12,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            if (isEnglish &&
                                zikr.contentTransliteration != null) ...[
                              const SizedBox(height: 12),
                              Text(
                                zikr.contentTransliteration!,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ],
                            if (isEnglish && zikr.contentEn != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                zikr.contentEn!,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        color: secondaryTextColor),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (favorText != null && favorText.isNotEmpty)
                    GestureDetector(
                      onTap: () => _showFavor(context, isEnglish),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).virtueAndSource,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(Icons.info_outline,
                              size: 15, color: Theme.of(context).primaryColor),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: GestureDetector(
              onTap: () =>
                  SharePlus.instance.share(ShareParams(text: shareText)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                decoration: BoxDecoration(
                  color: primaryGreen.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).shareLabel,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.ios_share, size: 17, color: primaryGreen),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AdhkarCounterRing(reps: reps, target: zikr.count),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).swipeHint,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.swap_horiz,
                  size: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
