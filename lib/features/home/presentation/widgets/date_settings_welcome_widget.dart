import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';

class DateSettingsWelcomeWidget extends StatefulWidget {
  const DateSettingsWelcomeWidget({super.key});

  @override
  State<DateSettingsWelcomeWidget> createState() =>
      _DateSettingsWelcomeWidgetState();
}

class _DateSettingsWelcomeWidgetState extends State<DateSettingsWelcomeWidget> {
  late HijriDate _hijriDate;
  @override
  void initState() {
    _hijriDate = JHijri.now().hijri;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const AccountBalanceRoute());
      },
      child: SizedBox(
        height: ScreenUtils.getScreenHeight(context) / 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton.filled(
                onPressed: () {
                  AutoRouter.of(context).push(const SettingsRoute());
                },
                style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                icon: Icon(Icons.settings_outlined,
                    color: Theme.of(context).iconTheme.color)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "مرحبا بعودتك",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: GeneralUtils.isLightTheme(context)
                          ? Theme.of(context).primaryColor
                          : appWhite,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${_hijriDate.dayName} ${ArabicNumbers().convert(_hijriDate.day)} ${ArabicNumbers().convert(_hijriDate.monthName)} ${_hijriDate.year}",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: GeneralUtils.isLightTheme(context)
                          ? appLightGold
                          : appDarkGold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
