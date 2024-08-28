import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/core/consts/images_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../../app_router.dart';
import '../../../core/consts/colors.dart';
import '../../../core/consts/text_styles.dart';

class DateSettingsWelcomeWidget extends StatefulWidget {
  const DateSettingsWelcomeWidget({super.key});

  @override
  State<DateSettingsWelcomeWidget> createState() =>
      _DateSettingsWelcomeWidgetState();
}

class _DateSettingsWelcomeWidgetState extends State<DateSettingsWelcomeWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(accountBalanceUrl);
      },
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 6,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              IconButton.filled(
                  onPressed: () {},
                  // color: Colors.black,
                  style:
                      IconButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "مرحبا بعودتك",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).primaryColor,fontSize: 30),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "26 ذو الحجة 1556 هجري",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Color(0xffEBAA00)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
