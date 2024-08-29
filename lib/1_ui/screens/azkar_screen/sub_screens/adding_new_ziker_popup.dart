import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/3_data/models/zikr.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ConstantValues.appHorizontalPadding.toDouble()),
      child: SizedBox(
        height: ScreenUtils.getScreenHeight(context) * .75,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16,),
                  Container(
                    
                    height: 5,
                    
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(11)),
                    width: ScreenUtils.getScreenWidth(context) /4,
                    
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddCustomZikrCubit>(context)
            .addCustomZikr(customZikrContent: newZikerController.text,customZikrDescription: newZikrDescription.text.isNotEmpty?newZikrDescription.text:null);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          color: Theme.of(context).primaryColor,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'إضافة الذكر',
              style: TextStyle(
                color: appWhite,
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
