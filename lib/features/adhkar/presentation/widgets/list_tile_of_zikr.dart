import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/screens/sub_screens/edit_custom_ziker_popup.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/delete_zikr_record_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTileOfZikr extends StatelessWidget {
  const ListTileOfZikr({
    super.key,
    required this.zikr,
    required this.onTap,
    required this.isSelected,
    this.useGreenCheckIndicator = false,
    this.onDeleteCustomZikr,
  });

  final bool isSelected;
  final ZikrEntity zikr;
  final Function() onTap;

  /// When true, renders the selection circle as a filled green check
  /// (used by the tasbih zikr-picker sheet) instead of the default gold
  /// filled/outlined circle used by the Azkar library screen.
  final bool useGreenCheckIndicator;

  /// When set, a custom zikr row shows a red trash icon that calls this
  /// instead of the gear icon that opens the edit popup (used by the
  /// tasbih zikr-picker sheet, which only needs quick delete, not edit).
  final VoidCallback? onDeleteCustomZikr;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final showTranslation = isEnglish && zikr.descriptionEn != null;
    final descriptionText =
        showTranslation ? zikr.descriptionEn! : (zikr.description ?? "");

    return ListTile(
      splashColor: Colors.transparent,
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (zikr.isCustomZikr == true && onDeleteCustomZikr != null)
                      GestureDetector(
                        onTap: onDeleteCustomZikr,
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      )
                    else if (zikr.isCustomZikr == true)
                      GestureDetector(
                        onTap: () => _showEditPopup(context),
                        child: Icon(
                          Icons.settings_outlined,
                          color: context.theme.primaryColor,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Expanded(
                      child: AutoSizeText(
                        zikr.content,
                        textDirection: TextDirection.rtl,
                        style: context.textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: useGreenCheckIndicator
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? context.theme.primaryColor
                                    : Colors.transparent,
                                border: isSelected
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color:
                                            GeneralUtils.isLightTheme(context)
                                                ? appGray
                                                : appLightGrey,
                                      ),
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check,
                                      size: 14, color: Colors.white)
                                  : null,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: GeneralUtils.isLightTheme(context)
                                      ? appLightGold
                                      : appDarkGold,
                                ),
                                color: isSelected
                                    ? (GeneralUtils.isLightTheme(context)
                                        ? appLightGold
                                        : appDarkGold)
                                    : Colors.transparent,
                              ),
                              height: 16,
                              width: 16,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isEnglish && zikr.contentTransliteration != null) ...[
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                zikr.contentTransliteration!,
                textDirection: TextDirection.ltr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: context.theme.primaryColor,
                ),
              ),
            ),
          ],
          if (isEnglish && zikr.contentEn != null) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                zikr.contentEn!,
                textDirection: TextDirection.ltr,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: GeneralUtils.isLightTheme(context)
                      ? appGray
                      : appLightGrey,
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            descriptionText,
            textDirection:
                showTranslation ? TextDirection.ltr : TextDirection.rtl,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 14,
              color:
                  GeneralUtils.isLightTheme(context) ? appGray : appLightGrey,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (dialogContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: context.read<UpdateCustomZikrCubit>()),
              BlocProvider.value(value: context.read<DeleteCustomZikrCubit>()),
              BlocProvider.value(value: context.read<UpdateCurrentZikrCubit>()),
              BlocProvider.value(value: context.read<DeleteZikrRecordCubit>()),
            ],
            child: EditCustomZikerPopup(
              zikr: zikr,
              isSelected: isSelected,
            ),
          ),
        );
      },
    );
  }
}
