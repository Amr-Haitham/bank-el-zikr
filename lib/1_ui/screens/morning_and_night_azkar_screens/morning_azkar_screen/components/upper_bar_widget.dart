import 'package:flutter/material.dart';

import '../../../../core/consts/colors.dart';

class MorningAzkarScreenUpperBarWidget extends StatelessWidget {
  const MorningAzkarScreenUpperBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 70,
            child: SizedBox(
              height: 98,
              width: 98,
              child: Image.asset(
                'assets/images/green_sun.png',
                scale: 1.3,
              ),
            ),
          ),
          const Positioned(
            top: 15,
            left: 187,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: appGreen,
            ),
          ),
          const Positioned(
            top: -0,
            left: 247,
            child: CircleAvatar(
              radius: 64,
              backgroundColor: appGreen,
            ),
          ),
          const Positioned(
            top: -11,
            left: 330,
            child: CircleAvatar(
              radius: 64,
              backgroundColor: appGreen,
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
                        //   color: appGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // child: const Center(
                      //   child: Text(
                      //     "الكل",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w800,
                      //         color: Colors.white),
                      //   ),
                      // ),
                    ),
                    const Text(
                      "أذكار الصباح",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: appGreen),
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
                    color: appGreen,
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
