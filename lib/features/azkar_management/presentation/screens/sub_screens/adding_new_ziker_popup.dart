import 'package:bank_el_ziker/core/presentation/widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewZikrPopUp extends StatefulWidget {
  const AddNewZikrPopUp({super.key});

  @override
  State<AddNewZikrPopUp> createState() => _AddNewZikrPopUpState();
}

class _AddNewZikrPopUpState extends State<AddNewZikrPopUp> {
  TextEditingController newZikerController = TextEditingController();
  TextEditingController newZikrDescription = TextEditingController();

  @override
  void dispose() {
    newZikerController.dispose();
    newZikrDescription.dispose();
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(11)),
                  width: ScreenUtils.getScreenWidth(context) / 4,
                ),
                CustomAppTextField(
                  title: 'الذكر',
                  controller: newZikerController,
                ),
                const SizedBox(height: 40),
                CustomAppTextField(
                  title: 'فضل الذكر',
                  controller: newZikrDescription,
                  optional: true,
                  maxLines: 5,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: saveButton()),
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
        // Validate input
        if (newZikerController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('الرجاء إدخال نص الذكر')),
          );
          return;
        }

        // Create new Zikr entity
        final newZikr = Zikr(
          id: 0, // Will be assigned by repository
          content: newZikerController.text.trim(),
          description: newZikrDescription.text.trim().isNotEmpty
              ? newZikrDescription.text.trim()
              : null,
          isCustomZikr: true,
          title: null, // Custom zikr don't have titles
        );

        // Add zikr using separate AddCustomZikrCubit
        context.read<AddCustomZikrCubit>().addZikr(newZikr);

        // Close dialog
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
            child: Text('إضافة الذكر',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        GeneralUtils.isLightTheme(context) ? appWhite : appDark,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}
