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
        width: size + 24,
        height: size + 24,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size + 24,
              height: size + 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: const Alignment(0, 0.2),
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.35),
                    Theme.of(context).colorScheme.secondary.withValues(
                        alpha: 0),
                  ],
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                strokeCap: StrokeCap.round,
                backgroundColor: Theme.of(context).cardColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
            Container(
              width: size - 12,
              height: size - 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 40,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
            ),
            Container(
              width: size - 26,
              height: size - 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: const Alignment(-0.3, -0.4),
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 0.55),
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.55),
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
                        color: Colors.black87,
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.bolt_rounded,
                            size: 14, color: Colors.black45),
                        const SizedBox(width: 4),
                        Text(
                          AppLocalizations.of(context).tapAnywhere,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black45),
                        ),
                      ],
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
