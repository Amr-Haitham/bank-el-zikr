import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/4_utility_functions/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../core/consts/colors.dart';
import '../../../core/consts/constant_values.dart';

class AddNewZikrPopUp extends StatefulWidget {
  const AddNewZikrPopUp({super.key});

  @override
  State<AddNewZikrPopUp> createState() => _AddNewZikrPopUpState();
}

class _AddNewZikrPopUpState extends State<AddNewZikrPopUp> {
  TextEditingController newZikerController = TextEditingController();
  TextEditingController newZikrDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    newZikerController.dispose();
    newZikrDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(
      //     horizontal: ConstantValues.appHorizontalPadding.toDouble()),
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
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                      color: GeneralUtils.isLightTheme(context)
                          ? appDark
                          : appWhite,
                      borderRadius: BorderRadius.circular(11)),
                  width: ScreenUtils.getScreenWidth(context) / 4,
                ),
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
                const SizedBox(
                  height: 40,
                ),
                CustomAppTextField(
                  title: 'فضل الذكر',
                  controller: newZikrDescription,
                  optional: true,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 48,
                ),
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
        BlocProvider.of<AddCustomZikrCubit>(context).addCustomZikr(
            customZikrContent: newZikerController.text,
            customZikrDescription: newZikrDescription.text.isNotEmpty
                ? newZikrDescription.text
                : null);
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
            padding: EdgeInsets.all(16),
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
