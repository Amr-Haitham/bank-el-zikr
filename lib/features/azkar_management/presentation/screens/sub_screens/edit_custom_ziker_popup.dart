import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/popup_functions.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/delete_zikr_record_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCustomZikerPopup extends StatefulWidget {
  const EditCustomZikerPopup({
    super.key,
    required this.zikr,
    required this.isSelected,
  });
  final ZikrEntity zikr;
  final bool isSelected;

  @override
  State<EditCustomZikerPopup> createState() => _EditCustomZikerPopupState();
}

class _EditCustomZikerPopupState extends State<EditCustomZikerPopup> {
  late TextEditingController edittedZikerContentController =
      TextEditingController(text: widget.zikr.content);
  late TextEditingController edittedZikerDescriptionController =
      TextEditingController(text: widget.zikr.description ?? "");

  @override
  void dispose() {
    edittedZikerContentController.dispose();
    edittedZikerDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ConstantValues.appHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                      color: GeneralUtils.isLightTheme(context)
                          ? appDark
                          : appWhite,
                      borderRadius: BorderRadius.circular(11)),
                  width: ScreenUtils.getScreenWidth(context) / 4,
                ),
                CustomAppTextField(
                  title: 'الذكر',
                  controller: edittedZikerContentController,
                ),
                const SizedBox(height: 40),
                CustomAppTextField(
                  title: 'فضل الذكر',
                  controller: edittedZikerDescriptionController,
                  optional: true,
                  maxLines: 4,
                ),
                const SizedBox(height: 38),
                Column(
                  children: [
                    saveButton(),
                    const SizedBox(height: 16),
                    deleteButton(),
                  ],
                ),
                const SizedBox(height: ConstantValues.appBottomPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        if (edittedZikerContentController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('الرجاء إدخال نص الذكر')),
          );
          return;
        }

        final updatedZikr = widget.zikr.copyWith(
          content: edittedZikerContentController.text.trim(),
          description: edittedZikerDescriptionController.text.trim().isNotEmpty
              ? edittedZikerDescriptionController.text.trim()
              : null,
        );

        context.read<UpdateCustomZikrCubit>().updateZikr(updatedZikr);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('حفظ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        GeneralUtils.isLightTheme(context) ? appWhite : appDark,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }

  Widget deleteButton() {
    return GestureDetector(
      onTap: () {
        PopupFunctions.deleteZikrDialog(
          context: context,
          content: "هل أنت متأكد من حذف الذكر",
          onDelete: () {
            // Delete the zikr itself
            context.read<DeleteCustomZikrCubit>().deleteZikr(widget.zikr.id);

            // If it was selected, reset to a default zikr (ID 1)
            if (widget.isSelected) {
              context.read<UpdateCurrentZikrCubit>().executeUpdate(1);
            }

            // Delete associated records
            context.read<DeleteZikrRecordCubit>().executeDelete(widget.zikr.id);

            Navigator.of(context).pop(); // Close dialog
            Navigator.of(context).pop(); // Close popup
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39),
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.red)),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'حذف الذكر',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
