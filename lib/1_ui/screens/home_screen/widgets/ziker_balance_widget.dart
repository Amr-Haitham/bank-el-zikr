import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/core/consts/images_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../../app_router.dart';
import '../../../core/consts/text_styles.dart';

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
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 6,
        //  width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImagesUrls.zikrBalanceBackgroundLightThemeHomeScreen))
            // color: Theme.of(context).primaryColor,
            // border: Border.all(color: Theme.of(context).primaryColor, width: 0),
            // borderRadius: BorderRadius.circular(10),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   "$currentBalance",
              //   style: const TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: 35,
              //       color: Colors.white),
              // ),
              IconButton.filled(
                  onPressed: () {},
                  // color: Colors.black,
                  style: IconButton.styleFrom(backgroundColor: const Color(0xff1A1A1A)),
                  
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "رصيد الذكر",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<GetGeneralDataCubit, GetGeneralDataState>(
                    builder: (context, state) {
                      if (state is GetGeneralDataLoaded) {
                        return AutoSizeText(
                          ArabicNumbers().convert(state.generalData.accountBalance).toString(),
                          maxLines: 1,
                          
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.headlineLarge,
                        );
                      } else if (state is GetGeneralDataError) {
                        return AutoSizeText(
                          "Error",
                          maxLines: 1,
                          textAlign: TextAlign.right,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
