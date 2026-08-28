import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class TasbihProgressCircle extends StatelessWidget {
  const TasbihProgressCircle({
    super.key,
    required this.currentCounter,
    required this.goal,
    required this.onReset,
    this.maxSize,
  });

  final int currentCounter;
  final int? goal;
  final VoidCallback onReset;

  /// Caps the circle's diameter (including its outer glow ring) so it never
  /// grows larger than the space actually left after the header above it —
  /// otherwise a long dhikr (Arabic text + transliteration + translation
  /// button) shrinks the available height while this circle stays a fixed
  /// fraction of screen width, overflowing the bottom of the screen.
  final double? maxSize;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseSize = screenWidth * .68;
    var size = baseSize;
    if (maxSize != null && size + 24 > maxSize!) {
      // Shrink only when the header above leaves too little room, so a
      // long dhikr never pushes the circle off-screen.
      size = (maxSize! - 24).clamp(160.0, size);
    }
    final progress = goal != null && goal! > 0
        ? (currentCounter / goal!).clamp(0.0, 1.0)
        : 0.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: size + 24,
          height: size + 24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size + 12,
                height: size + 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: const Alignment(0, 0.2),
                    colors: [
                      context.colors.secondary.withValues(alpha: 0.35),
                      context.colors.secondary.withValues(alpha: 0),
                    ],
                    stops: const [0.0, 0.85],
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
                  backgroundColor: context.theme.cardColor,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
                ),
              ),
              Container(
                width: size - 12,
                height: size - 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.cardColor,
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
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.theme.primaryColor.withValues(alpha: 0.75),
                      context.theme.primaryColor.withValues(alpha: 0.4),
                      context.colors.secondary.withValues(alpha: 0.55),
                    ],
                    stops: const [0.0, 0.35, 1.0],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: const Alignment(-0.2, -0.3),
                      child: Container(
                        width: (size - 26) * 0.6,
                        height: (size - 26) * 0.6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.65),
                              Colors.white.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
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
                              const SizedBox(width: 2),
                              Text(
                                AppLocalizations.of(context).tapAnywhere,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black45),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Tooltip(
            message: AppLocalizations.of(context).resetLabel,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onReset,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.16),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.refresh_rounded,
                    size: 20, color: context.theme.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
