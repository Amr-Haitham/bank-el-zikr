import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/screens/sub_screens/edit_custom_ziker_popup.dart';
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
  });

  final bool isSelected;
  final ZikrEntity zikr;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
                    if (zikr.isCustomZikr == true)
                      GestureDetector(
                        onTap: () => _showEditPopup(context),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Expanded(
                      child: AutoSizeText(
                        zikr.content,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
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
          const SizedBox(height: 8),
          Text(
            zikr.description ?? "",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: GeneralUtils.isLightTheme(context)
                      ? appGray
                      : appLightGrey,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              BlocProvider.value(
                  value: context.read<UpdateCustomZikrCubit>()),
              BlocProvider.value(
                  value: context.read<DeleteCustomZikrCubit>()),
              BlocProvider.value(
                  value: context.read<UpdateCurrentZikrCubit>()),
              BlocProvider.value(
                  value: context.read<DeleteZikrRecordCubit>()),
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
