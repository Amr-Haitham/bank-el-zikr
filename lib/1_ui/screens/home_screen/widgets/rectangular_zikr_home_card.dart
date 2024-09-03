import 'package:flutter/material.dart';

import '../../../../4_utility_functions/screen_utils.dart';

class RectangularZikrHomeCard extends StatelessWidget {
  const RectangularZikrHomeCard(
      {super.key, required this.title, required this.imageAssetUrl,required this.onTap});
  final String title;
  final String imageAssetUrl;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 6 - 10,
        width: ScreenUtils.getScreenWidth(context) / 2 - 30,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness==Brightness.light?const Color(0xffF3F3F3):const Color.fromRGBO(26, 26, 26, 1),
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
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
