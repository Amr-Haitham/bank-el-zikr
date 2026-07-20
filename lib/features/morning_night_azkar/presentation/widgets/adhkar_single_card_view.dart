import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'adhkar_counter_ring.dart';

class AdhkarSingleCardView extends StatelessWidget {
  const AdhkarSingleCardView({
    super.key,
    required this.zikr,
    required this.isMorning,
    required this.reps,
    required this.onTap,
  });

  final MorningNightZikrEntity zikr;
  final bool isMorning;
  final int reps;
  final VoidCallback onTap;

  void _showFavor(BuildContext context) {
    final favor = zikr.favor;
    if (favor == null || favor.isEmpty) return;
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
              textDirection: TextDirection.rtl,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Text(
              favor,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  Icon(
                    isMorning
                        ? Icons.wb_sunny_outlined
                        : Icons.nightlight_round,
                    color: isMorning
                        ? const Color(0xffFF9F43)
                        : const Color(0xff5E5CE6),
                    size: 28,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: AutoSizeText(
                        zikr.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        minFontSize: 13,
                        maxLines: 12,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  if (zikr.favor != null && zikr.favor!.isNotEmpty)
                    GestureDetector(
                      onTap: () => _showFavor(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            AppLocalizations.of(context).virtueAndSource,
                            textDirection: TextDirection.rtl,
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
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: AppLocalizations.of(context).shareLabel,
                  icon: Icons.ios_share,
                  onTap: () =>
                      SharePlus.instance.share(ShareParams(text: zikr.content)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  label: AppLocalizations.of(context).copyLabel,
                  icon: Icons.copy_rounded,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: zikr.content));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context).copied,
                            textDirection: TextDirection.rtl),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AdhkarCounterRing(reps: reps, target: zikr.count),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                AppLocalizations.of(context).swipeHint,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.5),
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodyMedium!.color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              label,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(width: 6),
            Icon(icon, size: 15, color: color),
          ],
        ),
      ),
    );
  }
}
