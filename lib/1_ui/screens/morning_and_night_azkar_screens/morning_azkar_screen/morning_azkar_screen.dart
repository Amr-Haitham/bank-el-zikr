import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/colors.dart';
import '../common/build_list_of_azkar_widget.dart';
import 'components/upper_bar_widget.dart';

class MorningAzkarScreen extends StatelessWidget {
  const MorningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Material(
        color: appWhite,
        child: Column(
          children: [
            const MorningAzkarScreenUpperBarWidget(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
                child: const BuildListOfAzkarWidget(
                  isMorningAzkar: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
