import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/delete_single_zikr_record/delete_single_zikr_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/delete_custom_zikr_cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/update_custom_zikr/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/1_ui/core/consts/initial_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../3_data/models/zikr.dart';
import '../../../core/consts/colors.dart';

class EditCustomZikerScreen extends StatefulWidget {
  const EditCustomZikerScreen(
      {super.key,
      required this.zikr,
      required this.zikrIndex,
      required this.isSelected});
  final Zikr zikr;
  final int zikrIndex;
  final bool isSelected;

  @override
  State<EditCustomZikerScreen> createState() => _EditCustomZikerScreenState();
}

class _EditCustomZikerScreenState extends State<EditCustomZikerScreen> {
  late TextEditingController edittedZikerController =
      TextEditingController(text: widget.zikr.content);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
           body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [TitleWithBackButton(title: "رصيد الذكر",),
                 Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تعديل الذكر",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                newZikrTextField(),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cancelButton(),
                        saveButton(),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [deleteButton()],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget newZikrTextField() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: edittedZikerController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                width: 2,
                color: Colors
                    .transparent), // Set border width and make it transparent initially
          ),
          focusedBorder: OutlineInputBorder(
            // Border when focused
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(
                width: 2, color: Theme.of(context).primaryColor), // Green border when focused
          ),
        ),
        maxLines: 5,
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<UpdateCustomZikrCubit>(context).updateCustomZikr(
            zikr: widget.zikr,
            zikrIndex: widget.zikrIndex,
            newContent: edittedZikerController.text);
        BlocProvider.of<AzkarCubit>(context).getAllAzkar();

        Navigator.of(context).pop();
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'حفظ',
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
          borderRadius: BorderRadius.circular(8),
          color: Colors.red,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'حذف الذكر',
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

  Widget cancelButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red),
          color: appWhite,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'إلفاء',
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
