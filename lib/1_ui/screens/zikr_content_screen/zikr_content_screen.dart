import 'package:bank_el_ziker/1_ui/core/consts/constant_values.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/3_data/models/zikr.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//todo
class ZikrContentScreen extends StatelessWidget {
  final Zikr zikr;
  const ZikrContentScreen({super.key, required this.zikr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: ConstantValues.appTopPadding,
                right: ConstantValues.appHorizontalPadding,
                left: ConstantValues.appHorizontalPadding),
            child: Center(
              child: Column(
                children: [
                  TitleWithBackButton(
                    title:zikr.title??"",
                  ),
                  // Text(
                  //   zikr.title ?? zikr.content,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(fontSize: 24),
                  // ),
                  // Text(
                  //   zikr.title ?? zikr.content,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       fontSize: 32,
                  //       fontWeight: FontWeight.w700,
                  //       color: Theme.of(context).primaryColor),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              zikr.content,
                              textAlign: TextAlign.center,
                              style:  Theme.of(context).textTheme.headlineMedium!.copyWith(color:Theme.of(context).primaryColor ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 16),
                              child: Divider(
                                color: Theme.of(context).textTheme.bodySmall!.color,
                                thickness: 1,
                              ),
                            ),
                            Text(
                              zikr.description ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
