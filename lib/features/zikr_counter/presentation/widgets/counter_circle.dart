import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CounterCircle extends StatelessWidget {
  final int currentCounter;
  final VoidCallback onTap;

  const CounterCircle({
    super.key,
    required this.currentCounter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Center(
          child: Container(
            width: screenWidth * .6,
            height: screenWidth * .6,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AutoSizeText(
                currentCounter != 0
                    ? ArabicNumbers().convert(currentCounter)
                    : "إضغط للبدء",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: currentCounter != 0 ? 70 : 24,
                      color: Theme.of(context).primaryColor,
                    ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
