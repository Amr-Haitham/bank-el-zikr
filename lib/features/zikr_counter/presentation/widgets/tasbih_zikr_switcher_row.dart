import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/zikr_picker_bottom_sheet.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/zikr_translation_sheet.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shows the current zikr's text with a button to switch to another one.
/// Reads live from [GetAllAzkarCubit] so it stays in sync without the
/// parent screen needing to thread azkar data down manually.
class TasbihZikrSwitcherRow extends StatelessWidget {
  const TasbihZikrSwitcherRow({super.key, required this.currentZikrKey});

  final String currentZikrKey;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
      builder: (context, azkarState) {
        return azkarState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          failure: (f) => const SizedBox.shrink(),
          success: (allAzkar) {
            final azkar = allAzkar
                .where((z) => z.category == 'general' || z.isCustomZikr)
                .toList();
            if (azkar.isEmpty) return const SizedBox.shrink();
            final currentZikr = azkar.firstWhere(
              (z) => z.key == currentZikrKey,
              orElse: () => azkar.first,
            );
            void openPicker() => ZikrPickerBottomSheet.show(context,
                currentZikrKey: currentZikrKey);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: openPicker,
                  child: AutoSizeText(
                    currentZikr.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    maxLines: 4,
                    minFontSize: 14,
                    style: context.textTheme.headlineSmall!.copyWith(
                        color: context.theme.primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                if (isEnglish && currentZikr.contentTransliteration != null) ...[
                  const SizedBox(height: ConstantValues.spacingSm),
                  Text(
                    currentZikr.contentTransliteration!,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}

/// The "Choose a Zikr" / "Translation" action pills, split out from
/// [TasbihZikrSwitcherRow] so the screen can place them right above the
/// tasbih circle (inside the same flex region) instead of in the header
/// block, which pushes the circle down by however tall this row is.
class TasbihZikrActionsRow extends StatelessWidget {
  const TasbihZikrActionsRow({super.key, required this.currentZikrKey});

  final String currentZikrKey;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
      builder: (context, azkarState) {
        return azkarState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          failure: (f) => const SizedBox.shrink(),
          success: (allAzkar) {
            final azkar = allAzkar
                .where((z) => z.category == 'general' || z.isCustomZikr)
                .toList();
            if (azkar.isEmpty) return const SizedBox.shrink();
            final currentZikr = azkar.firstWhere(
              (z) => z.key == currentZikrKey,
              orElse: () => azkar.first,
            );
            void openPicker() => ZikrPickerBottomSheet.show(context,
                currentZikrKey: currentZikrKey);

            return Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: openPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color:
                            context.theme.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.swap_horiz_rounded,
                              color: context.theme.primaryColor, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            AppLocalizations.of(context).chooseZikr,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isEnglish && currentZikr.contentEn != null) ...[
                    const SizedBox(width: ConstantValues.spacingSm),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => ZikrTranslationSheet.show(
                        context,
                        translation: currentZikr.contentEn!,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.translate_rounded,
                                color: context.theme.primaryColor, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              AppLocalizations.of(context).translation,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
