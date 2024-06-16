import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../../app_router.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/text_styles.dart';

class ZikerBalanceWidget extends StatefulWidget {
  const ZikerBalanceWidget({super.key});

  @override
  State<ZikerBalanceWidget> createState() => _ZikerBalanceWidgetState();
}

class _ZikerBalanceWidgetState extends State<ZikerBalanceWidget> {
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: ScreenUtils.getScreenHeight(context) / 7.5,
          width: ScreenUtils.getScreenWidth(context) - 50,
          decoration: BoxDecoration(
            color: appGreen,
            border: Border.all(color: appGreen, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GetGeneralDataCubit, GetGeneralDataState>(
                  builder: (context, state) {
                    if (state is GetGeneralDataLoaded) {
                      return AutoSizeText(
                        state.generalData.accountBalance.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: cairoTextStyle(
                            19.sp, FontWeight.w800, null, Colors.white),
                      );
                    } else if (state is GetGeneralDataError) {
                      return AutoSizeText(
                        "Error",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: cairoTextStyle(
                            19.sp, FontWeight.w800, null, Colors.white),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),

                // Text(
                //   "$currentBalance",
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 35,
                //       color: Colors.white),
                // ),

                const Row(
                  children: [
                    Text(
                      "رصيد البنك",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.account_balance_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
