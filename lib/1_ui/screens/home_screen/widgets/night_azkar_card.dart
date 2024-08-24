import 'package:flutter/material.dart';
import '../../../../4_utility_functions/screen_utils.dart';
import '../../../core/consts/colors.dart';


class NightAzkarCard extends StatelessWidget {
  const NightAzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).pushNamed('nightAzkarScreen');
    },
    child:
    Column(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: appGreen,
            child:CircleAvatar(
              radius: 33,
              backgroundColor: appWhite,
              child: SizedBox(height: 66, width: 66, child:
              Image.asset('assets/images/night_circle_components.png', fit: BoxFit.contain,),
              ),),),
          const Text(
            "أذكار المساء",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: appDarkTextColor),
          ),
        ],
      ),
    );
  }
}

class RecuangularNightAzkarCard extends StatelessWidget {
  const RecuangularNightAzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('nightAzkarScreen');
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
                      "أذكار المساء",
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
                left: 0,
                top: 80,
                child: Image.asset(
                  'assets/images/stars1.png',
                  scale: 2.5,
                ),
              ),
              Positioned(
                left: 10,
                top: 50,
                child: Image.asset(
                  'assets/images/stars2.png',
                  scale: 2.5,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Image.asset(
                  'assets/images/moon.png',
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