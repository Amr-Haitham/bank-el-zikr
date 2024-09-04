import 'package:bank_el_ziker/1_ui/core/consts/constant_values.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/delete_single_zikr_record/delete_single_zikr_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/delete_custom_zikr_cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/update_custom_zikr/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/1_ui/core/consts/initial_data.dart';
import 'package:bank_el_ziker/4_utility_functions/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../3_data/models/zikr.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../core/consts/colors.dart';

class EditCustomZikerPopup extends StatefulWidget { 
  const EditCustomZikerPopup(
      {super.key,
      required this.zikr,
      required this.zikrIndex,
      required this.isSelected});
  final Zikr zikr;
  final int zikrIndex;
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    edittedZikerContentController.dispose();
    edittedZikerDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ScreenUtils.getScreenHeight(context) * .75,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ConstantValues.appHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                      color:GeneralUtils.isLightTheme(context) ?appDark:appWhite,
                      borderRadius: BorderRadius.circular(11)),
                  width: ScreenUtils.getScreenWidth(context) / 4,
                ),
                
                CustomAppTextField(
                  title: 'الذكر',
                  controller: edittedZikerContentController,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomAppTextField(
                  title: 'فضل الذكر',
                  controller: edittedZikerDescriptionController,
                  optional: true,
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 38,
                ),
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

  // Widget newZikrTextField() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: TextField(
  //       textDirection: TextDirection.rtl,
  //       controller: edittedZikerController,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: const BorderSide(
  //               width: 2,
  //               color: Colors
  //                   .transparent), // Set border width and make it transparent initially
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           // Border when focused
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide:  BorderSide(
  //               width: 2, color: Theme.of(context).primaryColor), // Green border when focused
  //         ),
  //       ),
  //       maxLines: 5,
  //     ),
  //   );
  // }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<UpdateCustomZikrCubit>(context).updateCustomZikr(
          zikr: widget.zikr,
          zikrIndex: widget.zikrIndex,
          newContent: edittedZikerContentController.text,
          newZikrDescription: edittedZikerDescriptionController.text,
        );
        BlocProvider.of<AzkarCubit>(context).getAllAzkar();

        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          color: Theme.of(context).primaryColor,
        ),
        child:  Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'حفظ',
              style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
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
        BlocProvider.of<DeleteCustomZikrCubit>(context)
            .deleteCustomZikr(zikrIndex: widget.zikrIndex);

        widget.isSelected
            ? BlocProvider.of<UpdateGeneralDataCubit>(context)
                .updateGeneralDataCurrentZikr(InitialData.generalAzkar.first.id)
            : null;
        BlocProvider.of<DeleteSingleZikrRecordCubit>(context)
            .deleteZikrRecord(zikrId: widget.zikr.id);
        BlocProvider.of<AzkarCubit>(context).getAllAzkar();
        Navigator.of(context).pop();
      },
      child: Container(
        // width: 100,
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

  // Widget cancelButton() {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).pop();
  //     },
  //     child: Container(
  //       width: 100,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.red),
  //         color: appWhite,
  //       ),
  //       child: const Center(
  //         child: Padding(
  //           padding: EdgeInsets.all(16),
  //           child: Text(
  //             'إلفاء',
  //             style: TextStyle(
  //               color: Colors.red,
  //               fontSize: 16,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
