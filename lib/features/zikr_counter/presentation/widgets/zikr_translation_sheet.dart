import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ZikrTranslationSheet extends StatelessWidget {
  const ZikrTranslationSheet({super.key, required this.translation});

  final String translation;

  static Future<void> show(BuildContext context,
      {required String translation}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => ZikrTranslationSheet(translation: translation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          ConstantValues.spacingXl,
          ConstantValues.spacingLg,
          ConstantValues.spacingXl,
          ConstantValues.spacingXl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.textTheme.bodySmall!.color!
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: ConstantValues.spacingLg),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.translate_rounded,
                      color: context.theme.primaryColor, size: 20),
                ),
                const SizedBox(width: ConstantValues.spacingSm),
                Text(
                  AppLocalizations.of(context).translation,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: ConstantValues.spacingLg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(ConstantValues.spacingLg),
              decoration: BoxDecoration(
                color: context.theme.primaryColor.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                translation,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: context.textTheme.bodyLarge!.copyWith(height: 1.5),
              ),
            ),
            const SizedBox(height: ConstantValues.spacingXl),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).maybePop(),
                style: FilledButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: ConstantValues.spacingMd),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  MaterialLocalizations.of(context).closeButtonLabel,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
