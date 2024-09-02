import 'package:flutter/material.dart';

import '../4_utility_functions/screen_utils.dart';
import '../app_router.dart';

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
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Theme.of(context).primaryColor, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              bigWhiteCircleWithSmallerYellowCirclesOnIt(context),

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

  Widget bigWhiteCircleWithSmallerYellowCirclesOnIt(context){
    return Stack(
      children: [
         Positioned(
          left: -35,
          top: 30,
          child: CircleAvatar(
            radius: 92,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 22,
          child: smallGreenCircle(context),
        ),
        Positioned(
          left: 47,
          top: 18,
          child: smallGreenCircle(context),
        ),
        Positioned(
          left: 78,
          top: 25,
          child: smallGreenCircle(context),
        ),
        Positioned(
          left: 105,
          top: 40,
          child: smallGreenCircle(context),
        ),
        Positioned(
          left: 123,
          top: 65,
          child: smallGreenCircle(context),
        ),
      ],
    );
  }

  Widget smallGreenCircle(context) {
    return  CircleAvatar(
      radius: 14,
      backgroundColor: Colors.yellow,
      child: CircleAvatar(
        radius: 11,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
