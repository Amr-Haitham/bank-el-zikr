import 'package:bank_el_ziker/core/constants/images_urls.dart';
import 'package:bank_el_ziker/app_router.dart';
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
              imageAssetUrl: ImagesUrls.prayingInNight,onTap: () {
                Navigator.of(context).pushNamed(nightAzkarScreen);
              }
            ),
            const SizedBox(
              height: 15,
            ),
            RectangularZikrHomeCard(
              title: 'أذكار الأحوال',
              imageAssetUrl: ImagesUrls.prayingHands,onTap: () {
                Navigator.of(context).pushNamed(situationsAzkarScreen);
              }
            ),
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
                Navigator.of(context).pushNamed(morningAzkarScreen);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            RectangularZikrHomeCard(
              title: 'تسبيح',
              imageAssetUrl: ImagesUrls.masbaha,
              onTap: () {
                Navigator.of(context).pushNamed(tasbeehWerdScreen);
              },
            ),
          ]),
        ),
      ],
    );
  }
}
