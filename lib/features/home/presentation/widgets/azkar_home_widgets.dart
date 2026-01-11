import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/images_urls.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:flutter/cupertino.dart';

import 'rectangular_zikr_home_card.dart';

class AzkarHomeWidgets extends StatelessWidget {
  const AzkarHomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(children: [
            RectangularZikrHomeCard(
                title: 'أذكار المساء',
                imageAssetUrl: ImagesUrls.prayingInNight,
                onTap: () {
                  AutoRouter.of(context).push(const NightAzkarRoute());
                }),
            const SizedBox(
              height: 15,
            ),
            RectangularZikrHomeCard(
                title: 'أذكار الأحوال',
                imageAssetUrl: ImagesUrls.prayingHands,
                onTap: () {
                  AutoRouter.of(context).push(const SituationsAzkarRoute());
                }),
          ]),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(children: [
            RectangularZikrHomeCard(
              title: 'أذكار الصباح',
              imageAssetUrl: ImagesUrls.prayingInMorning,
              onTap: () {
                AutoRouter.of(context).push(const MorningAzkarRoute());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            RectangularZikrHomeCard(
              title: 'تسبيح',
              imageAssetUrl: ImagesUrls.masbaha,
              onTap: () {
                AutoRouter.of(context).push(const TasbeehWerdRoute());
              },
            ),
          ]),
        ),
      ],
    );
  }
}
