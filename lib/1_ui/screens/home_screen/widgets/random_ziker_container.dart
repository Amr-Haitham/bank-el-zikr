import 'package:bank_el_ziker/2_state_management/get_random_prayer_cubit/get_random_prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../core/consts/colors.dart';

class RandomZikerContainer extends StatelessWidget {
  const RandomZikerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetRandomPrayerCubit>(context).getPrayer();

    return BlocBuilder<GetRandomPrayerCubit, GetRandomPrayerState>(
      builder: (context, state) {
        if (state is GetRandomPrayerLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          );
        } else if (state is GetRandomPrayerLoaded) {
          String prayer = state.prayer.content;

          return prayerContainer(prayer, context);
        } else if (state is GetRandomPrayerError) {
          return Center(
            child: backupPrayer(context),
          );
        } else {
          return Center(
            child: backupPrayer(context),
          );
        }
      },
    );
  }

  Widget prayerContainer(String prayer, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 5,
        width: ScreenUtils.getScreenWidth(context) - 50,
        decoration: BoxDecoration(
          border: Border.all(color: appGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                prayer,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    // height: 1.5,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: appDarkTextColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backupPrayer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 8,
        width: ScreenUtils.getScreenWidth(context) - 50,
        decoration: BoxDecoration(
          border: Border.all(color: appGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: appDarkTextColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
