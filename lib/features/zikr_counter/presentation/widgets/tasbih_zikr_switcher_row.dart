import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/zikr_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shows the current zikr's text with a button to switch to another one.
/// Reads live from [GetAllAzkarCubit] so it stays in sync without the
/// parent screen needing to thread azkar data down manually.
class TasbihZikrSwitcherRow extends StatelessWidget {
  const TasbihZikrSwitcherRow({super.key, required this.currentZikrKey});

  final String currentZikrKey;

  /// Shrinks the caption font a bit once the text gets long enough that a
  /// fixed 13px would risk overflowing its 2-line budget.
  static double _captionFontSize(String text) => text.length > 70 ? 11 : 13;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
      builder: (context, azkarState) {
        return azkarState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          failure: (f) => const SizedBox.shrink(),
          success: (azkar) {
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
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: openPicker,
                          child: Transform.translate(
                            offset: Offset(0, isEnglish ? 0 : 15),
                            child: AutoSizeText(
                              currentZikr.content,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              maxLines: 2,
                              minFontSize: 18,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 34),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: openPicker,
                        child: Transform.translate(
                          offset: Offset(-3, isEnglish ? -7 : 8),
                          child: SizedBox(
                            width: 34,
                            height: 34,
                            child: Icon(Icons.swap_horiz_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 44),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isEnglish && currentZikr.contentTransliteration != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    currentZikr.contentTransliteration!,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _captionFontSize(currentZikr.contentTransliteration!),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
                if (isEnglish && currentZikr.contentEn != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    currentZikr.contentEn!,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: _captionFontSize(currentZikr.contentEn!),
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withValues(alpha: 0.7),
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
