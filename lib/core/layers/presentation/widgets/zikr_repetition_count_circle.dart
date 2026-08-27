import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

class ZikrRepetitonCountCircle extends StatefulWidget {
  final int count;
  final bool isMorningZikr;
  final Function() onFinished;
  const ZikrRepetitonCountCircle(
      {super.key,
      required this.count,
      required this.isMorningZikr,
      required this.onFinished});

  @override
  State<ZikrRepetitonCountCircle> createState() =>
      _ZikrRepetitonCountCircleState();
}

class _ZikrRepetitonCountCircleState extends State<ZikrRepetitonCountCircle> {
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.scaffoldBackgroundColor,
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(255, 214, 0, 1))),
            child: Center(
              child: Text(
                ArabicNumbers().convert(count),
                style: context.textTheme.bodyLarge,
                strutStyle:
                    const StrutStyle(height: 1.2, forceStrutHeight: true),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "عدد التكرار",
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
