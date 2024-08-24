import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedStartWidget extends StatefulWidget {
  const AnimatedStartWidget({super.key});

  @override
  State<AnimatedStartWidget> createState() => _AnimatedStartWidgetState();
}

class _AnimatedStartWidgetState extends State<AnimatedStartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      //reverseCurve: Curves.easeOutBack // Apply easeInOut curve
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(_animationController.value * -60.w, 0),
                  child: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: appGreen,
                  ));
            }),
        AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(_animationController.value * 60.w, 0),
                  child: Text(
                    "إبدأ",
                    style:
                        cairoTextStyle(30.sp, FontWeight.w700, null, appGreen),
                  ));
            })
      ],
    );
  }
}
