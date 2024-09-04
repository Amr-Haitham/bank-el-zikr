import 'package:bank_el_ziker/1_ui/core/consts/images_urls.dart';
import 'package:bank_el_ziker/2_state_management/get_random_prayer_cubit/get_random_prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../4_utility_functions/screen_utils.dart';

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
            child: prayerContainer(
                "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
                context),
          );
        } else {
          return Center(
            child: prayerContainer(
                "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
                context),
          );
        }
      },
    );
  }

  Widget prayerContainer(String prayer, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: ScreenUtils.getScreenHeight(context) / 6,
      // width: ScreenUtils.getScreenWidth(context) - 50,
      decoration: BoxDecoration(
        // border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        // color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Theme.of(context).brightness == Brightness.dark
                ? ImagesUrls.randomZikrBackgroundDarkTheme
                : ImagesUrls.randomZikrBackgroundLightTheme)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "دعاء",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
            Center(
              child: Text(
                prayer,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget backupPrayer(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Container(
  //       height: ScreenUtils.getScreenHeight(context) / 8,
  //       width: ScreenUtils.getScreenWidth(context) - 50,
  //       decoration: BoxDecoration(
  //       image: DecorationImage(image: AssetImage(ImagesUrls.randomZikrBackgroundLightTheme)),
  //         // border: Border.all(color: Theme.of(context).primaryColor, width: 2),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(10),
  //         child: Center(
  //           child: SingleChildScrollView(
  //             child: Text(
  //               "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
  //               textAlign: TextAlign.end,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.w700,
  //                   fontSize: 16,
  //                   color: appGray),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
