import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class TasbihProgressCircle extends StatelessWidget {
  const TasbihProgressCircle({
    super.key,
    required this.currentCounter,
    required this.goal,
  });

  final int currentCounter;
  final int? goal;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final size = screenWidth * .62;
    final progress = goal != null && goal! > 0
        ? (currentCounter / goal!).clamp(0.0, 1.0)
        : 0.0;

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                backgroundColor: Theme.of(context).cardColor,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xffFFB800)),
              ),
            ),
            Container(
              width: size - 26,
              height: size - 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 0.55),
                    const Color(0xffE8D96A).withValues(alpha: 0.55),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      formatNumber(context, currentCounter),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    if (goal != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context)
                            .ofCount(formatNumber(context, goal!)),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context).tapAnywhere,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
