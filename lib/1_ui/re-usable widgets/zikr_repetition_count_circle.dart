import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';

class ZikrRepetitonCountCircle extends StatefulWidget {
  final int count;
  final bool isMorningZikr;
  const ZikrRepetitonCountCircle(
      {super.key, required this.count, required this.isMorningZikr});

  @override
  State<ZikrRepetitonCountCircle> createState() =>
      _ZikrRepetitonCountCircleState();
}

class _ZikrRepetitonCountCircleState extends State<ZikrRepetitonCountCircle> {
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (count > 0) {
          setState(() {
            count--;
          });
        }
      },
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor:
                        Theme.of(context).primaryColor ,
                    child: Center(
                      child: CircleAvatar(
                        radius: 33,
                        backgroundColor:
                            Colors.white ,
                        child: Center(
                          child: Text(
                            count.toString(),
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //---------------------------------------//
                //Top right small circles
                const Positioned(
                  left: 35,
                  top: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  left: 45,
                  top: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  left: 54,
                  top: 7,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  left: 61,
                  top: 13,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  left: 66.5,
                  top: 21.5,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),
                //---------------------------------------//

                //---------------------------------------//
                //bottom left small circles
                const Positioned(
                  right: 35,
                  bottom: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  right: 45,
                  bottom: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  right: 54,
                  bottom: 7,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  right: 61,
                  bottom: 13,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),

                const Positioned(
                  right: 66.5,
                  bottom: 21.5,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ),
                //---------------------------------------//
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            "عدد التكرار",
            style: TextStyle(
              color:Theme.of(context).primaryColor ,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
