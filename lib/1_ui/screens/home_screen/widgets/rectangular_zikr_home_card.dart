import 'package:bank_el_ziker/1_ui/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../4_utility_functions/screen_utils.dart';
import '../../../../app_router.dart';
import '../../../core/consts/colors.dart';

class RectangularZikrHomeCard extends StatelessWidget {
  const RectangularZikrHomeCard(
      {super.key, required this.title, required this.imageAssetUrl});
  final String title;
  final String imageAssetUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(morningAzkarScreen);
      },
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 6 - 10,
        width: ScreenUtils.getScreenWidth(context) / 2 - 30,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                children: [Image.asset(imageAssetUrl)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
