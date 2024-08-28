import 'package:flutter/material.dart';

import '../../../../core/consts/colors.dart';

class NightAzkarScreenUpperBarWidget extends StatelessWidget {
  const NightAzkarScreenUpperBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 73,
            left: -24,
            child: SizedBox(
              height: 98,
              width: 98,
              child: Image.asset(
                'assets/images/night_mood_stars.png',
                scale: 1.3,
              ),
            ),
          ),

          Positioned(
            top: 75,
            left: 115,
            child: SizedBox(
              height: 98,
              width: 98,
              child: Image.asset(
                'assets/images/night_mood_stars.png',
                scale: 1.3,
              ),
            ),
          ),

          Positioned(
            top: 60,
            left: 270,
            child: SizedBox(
              height: 110,
              width: 110,
              child: Image.asset('assets/images/night_mood_moon.png'),
            ),
          ),

          Positioned(
            top: 180,
            left: 31,
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 71,
                      height: 28,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // child: const Center(
                      //   child: Text(
                      //     "الكل",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w800,
                      //         color: Theme.of(context).primaryColor),
                      //   ),
                      // ),
                    ),
                    const Text(
                      "أذكار المساء",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                )),
          ),

          Positioned(
            top: 30,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/images/Vectorback_button.png',
                    fit: BoxFit.contain,
                    color: appWhite,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
