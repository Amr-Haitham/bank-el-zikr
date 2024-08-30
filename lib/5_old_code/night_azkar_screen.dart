import 'package:bank_el_ziker/1_ui/screens/morning_and_night_azkar_screens/common/build_list_of_azkar_widget.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NightAzkarScreen extends StatelessWidget {
  const NightAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Material(
        color: appWhite,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
                child: const BuildListOfAzkarWidget(
                  isMorningAzkar: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
