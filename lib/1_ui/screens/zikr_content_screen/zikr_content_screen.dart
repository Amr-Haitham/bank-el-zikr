import 'package:bank_el_ziker/1_ui/re-usable%20widgets/back_button.dart';
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
      backgroundColor: appWhite,
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 30.w, left: 30.w),
          child: Center(
            child: Column(
              children: [
                // Text(
                //   zikr.title ?? zikr.content,
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(fontSize: 24),
                // ),
                Text(
                  zikr.title ?? zikr.content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: appGreen),
                ),
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
                            style: const TextStyle(fontSize: 24),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 50, horizontal: 16),
                            child: Divider(
                              color: appGreen,
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
    );
  }
}
