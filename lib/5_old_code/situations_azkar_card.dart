import 'package:flutter/material.dart';

import '../4_utility_functions/screen_utils.dart';
import '../1_ui/core/consts/colors.dart';

class SituationsAzkarCard extends StatelessWidget {
  const SituationsAzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('conditionalAzkarScreen');
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: Theme.of(context).primaryColor,
            child: CircleAvatar(
              radius: 33,
              backgroundColor: appWhite,
              child: Center(
                child: SizedBox(
                  width: 46,
                  child: Image.asset('assets/images/sleeping_man.png'),
                ),
              ),
            ),
          ),
          const Text(
            "أذكار الأحوال",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: appGray),
          ),
        ],
      ),
    );
  }
}

class RectangularSituationsAzkarCard extends StatelessWidget {
  const RectangularSituationsAzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('conditionalAzkarScreen');
        },
        child: Container(
          height: ScreenUtils.getScreenHeight(context) / 3 - 10,
          width: ScreenUtils.getScreenWidth(context) / 2 - 30,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Stack(
              children: [
                 Positioned(
                  right: 30,
                  top: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "أذكار\nالأحوال",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    height: ScreenUtils.getScreenHeight(context) / 8 - 10,
                    width: ScreenUtils.getScreenWidth(context) / 3.2 - 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Theme.of(context).primaryColor, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/night.png',
                        scale: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
