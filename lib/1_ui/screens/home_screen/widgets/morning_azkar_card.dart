import 'package:flutter/material.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../../app_router.dart';
import '../../../../consts/colors.dart';

class MorningAzkarCard extends StatelessWidget {
  const MorningAzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(morningAzkarScreen);
      },
      child: Column(
        children: [
          SizedBox(
            height: 68,
            width: 68,
            child: Image.asset('assets/images/morning_circle.png'),
          ),
          const Text(
            "أذكار الصباح",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: appDarkTextColor),
          ),
        ],
      ),
    );
  }
}

class RectangularMorningAzkarCard extends StatelessWidget {
  const RectangularMorningAzkarCard({super.key});

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
          border: Border.all(color: appGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                left: 30,
                top: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "أذكار الصباح",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: appGreen),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                top: 50,
                child: Image.asset(
                  'assets/images/sun.png',
                  scale: 3,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/clouds.png',
                  scale: 3.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
