import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/initial_data.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/zikr_share_sheet.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

import 'adhkar_counter_ring.dart';

class AdhkarSingleCardView extends StatelessWidget {
  const AdhkarSingleCardView({
    super.key,
    required this.zikr,
    required this.reps,
    required this.onTap,
    required this.onComplete,
  });

  final ZikrEntity zikr;
  final int reps;
  final VoidCallback onTap;
  final VoidCallback onComplete;

  IconData get _icon {
    for (final category in InitialData.categories) {
      if (category.key == zikr.category) return category.icon;
    }
    return Icons.self_improvement_outlined;
  }

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
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(ConstantValues.spacingXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).virtueAndSource,
              style: context.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Text(
              favor,
              textAlign: TextAlign.center,
              textDirection: favorDirection,
              style: context.textTheme.bodyMedium,
            ),
            if (source != null && source.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                source,
                textAlign: TextAlign.center,
                textDirection: favorDirection,
                style: context.textTheme.bodySmall,
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
    final secondaryTextColor = context.textTheme.bodySmall!.color!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(ConstantValues.spacingXl),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
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
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: context.colors.onSurface,
                              ),
                            ),
                            if (isEnglish &&
                                zikr.contentTransliteration != null) ...[
                              const SizedBox(height: 12),
                              Text(
                                zikr.contentTransliteration!,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: context.theme.primaryColor,
                                ),
                              ),
                            ],
                            if (isEnglish && zikr.contentEn != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                zikr.contentEn!,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                style: context.textTheme.bodyMedium!.copyWith(
                                    fontSize: 14, color: secondaryTextColor),
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
                              color: context.theme.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(Icons.info_outline,
                              size: 15, color: context.theme.primaryColor),
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
              onTap: () => ZikrShareSheet.show(
                context,
                content: zikr.content,
                translation: isEnglish ? zikr.contentEn : null,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 44, vertical: ConstantValues.spacingSm),
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
          if (reps < zikr.count) ...[
            const SizedBox(height: 14),
            GestureDetector(
              onTap: onComplete,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 44, vertical: ConstantValues.spacingSm),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryGreen.withValues(alpha: 0.4),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).markCompleted,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.check_circle_outline,
                        size: 16, color: primaryGreen),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).swipeHint,
                style: context.textTheme.labelSmall!.copyWith(
                  color: context.textTheme.bodySmall!.color!,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.swap_horiz,
                  size: 16,
                  color: context.textTheme.bodySmall!.color!
                      .withValues(alpha: 0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
