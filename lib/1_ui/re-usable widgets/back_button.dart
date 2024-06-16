import 'package:bank_el_ziker/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  const CustomBackButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/images/Vectorback_button.png',
            fit: BoxFit.contain,
            color: color ?? appGreen,
          ),
        ),
      ),
    );
  }
}
