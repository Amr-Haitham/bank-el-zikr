import 'package:flutter/material.dart';

class CategoryStreakRing extends StatelessWidget {
  const CategoryStreakRing({
    super.key,
    required this.title,
    required this.currentStreak,
    required this.color,
  });

  final String title;
  final int currentStreak;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final progress = (currentStreak / 7).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 76,
            height: 76,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 76,
                  height: 76,
                  child: CircularProgressIndicator(
                    value: progress == 0 ? 1 : progress,
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                    backgroundColor: color.withValues(alpha: 0.15),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        progress == 0 ? color.withValues(alpha: 0.15) : color),
                  ),
                ),
                Text(
                  "$currentStreak",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
