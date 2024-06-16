import 'package:bank_el_ziker/1_ui/re-usable%20widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import '../../../../consts/colors.dart';

class AddNewZikrScreen extends StatefulWidget {
  const AddNewZikrScreen({super.key});

  @override
  State<AddNewZikrScreen> createState() => _AddNewZikrScreenState();
}

class _AddNewZikrScreenState extends State<AddNewZikrScreen> {
  TextEditingController newZikerController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "إضافة ذكر",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: appGreen),
                      ),
                    ],
                  ),
                ),
                newZikrTextField(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    cancelButton(),
                    saveButton(),
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
        controller: newZikerController,
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
            borderSide: const BorderSide(
                width: 2, color: appGreen), // Green border when focused
          ),
        ),
        maxLines: 5,
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddCustomZikrCubit>(context)
            .addCustomZikr(customZikrContent: newZikerController.text);
        Navigator.of(context).pop();
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appGreen,
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
