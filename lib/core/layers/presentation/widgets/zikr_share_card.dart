import 'package:flutter/material.dart';

class ZikrShareCard extends StatelessWidget {
  const ZikrShareCard({
    super.key,
    required this.content,
    required this.appName,
    this.translation,
  });

  final String content;
  final String appName;
  final String? translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo.png', width: 56, height: 56),
          const SizedBox(height: 24),
          Text(
            content,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff1A1A1A),
            ),
          ),
          if (translation != null) ...[
            const SizedBox(height: 16),
            Text(
              translation!,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Color(0xff5A5A5A),
              ),
            ),
          ],
          const SizedBox(height: 28),
          Container(
            height: 1,
            color: const Color(0xffE5E5E5),
          ),
          const SizedBox(height: 16),
          Text(
            appName,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff34C759),
            ),
          ),
        ],
      ),
    );
  }
}
