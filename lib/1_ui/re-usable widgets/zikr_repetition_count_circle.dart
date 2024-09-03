import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

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
      onTap: () {
        
      },
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(255, 214, 0, 1))),
            child: Center(
              child: Text(
                count.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
                strutStyle: const StrutStyle(height: 1.2, forceStrutHeight: true),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "عدد التكرار",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
