import 'package:flutter/material.dart';

import '../4_utility_functions/screen_utils.dart';
import '../app_router.dart';
import '../1_ui/core/consts/colors.dart';

class TasbeehCard extends StatelessWidget {
  const TasbeehCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(tasbeehWerdScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: ScreenUtils.getScreenHeight(context) / 7.5,
          width: ScreenUtils.getScreenWidth(context) - 50,
          decoration: BoxDecoration(
            color: appGreen,
            border: Border.all(color: appGreen, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              bigWhiteCircleWithSmallerYellowCirclesOnIt(),

              const Positioned(
                right: 10,
                top: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ورد التسبيح",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }

  Widget bigWhiteCircleWithSmallerYellowCirclesOnIt(){
    return Stack(
      children: [
        const Positioned(
          left: -35,
          top: 30,
          child: CircleAvatar(
            radius: 92,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: appGreen,
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 22,
          child: smallGreenCircle(),
        ),
        Positioned(
          left: 47,
          top: 18,
          child: smallGreenCircle(),
        ),
        Positioned(
          left: 78,
          top: 25,
          child: smallGreenCircle(),
        ),
        Positioned(
          left: 105,
          top: 40,
          child: smallGreenCircle(),
        ),
        Positioned(
          left: 123,
          top: 65,
          child: smallGreenCircle(),
        ),
      ],
    );
  }

  Widget smallGreenCircle() {
    return const CircleAvatar(
      radius: 14,
      backgroundColor: Colors.yellow,
      child: CircleAvatar(
        radius: 11,
        backgroundColor: appGreen,
      ),
    );
  }
}
