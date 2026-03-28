import 'package:bank_el_ziker/core/constants/images_urls.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/presentation/cubit/get_random_prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomZikerContainer extends StatelessWidget {
  const RandomZikerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRandomPrayerCubit, RequestState<PrayerEntity>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
          success: (prayer) {
            return prayerContainer(prayer.content, context);
          },
          failure: (failure) {
            return Center(
              child: prayerContainer(
                  "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
                  context),
            );
          },
        );
      },
    );
  }

  Widget prayerContainer(String prayer, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: ScreenUtils.getScreenHeight(context) / 6,
      decoration: BoxDecoration(
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
}
