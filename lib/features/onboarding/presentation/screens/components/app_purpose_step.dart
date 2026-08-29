import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AppPurposeStep extends StatefulWidget {
  const AppPurposeStep({super.key});

  @override
  State<AppPurposeStep> createState() => _AppPurposeStepState();
}

class _AppPurposeStepState extends State<AppPurposeStep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  late final Animation<double> _cardScale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.5, curve: Curves.easeOutBack),
  );

  late final Animation<double> _cardFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.4, curve: Curves.easeOut),
  );

  late final Animation<double> _textFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
  );

  late final Animation<Offset> _textSlide = Tween(
    begin: const Offset(0, 0.15),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.75, curve: Curves.easeOutCubic),
  ));

  late final Animation<double> _countUp = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.5, 1, curve: Curves.easeOutCubic),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ConstantValues.appHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 2),
          FadeTransition(
            opacity: _cardFade,
            child: ScaleTransition(
              scale: _cardScale,
              child: _HasanatPreviewCard(countUp: _countUp),
            ),
          ),
          const SizedBox(height: 32),
          FadeTransition(
            opacity: _textFade,
            child: SlideTransition(
              position: _textSlide,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context).onboardingPurposeTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context).onboardingPurposeSubtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!
                        .copyWith(fontSize: 15, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class _HasanatPreviewCard extends StatelessWidget {
  const _HasanatPreviewCard({required this.countUp});

  final Animation<double> countUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(ConstantValues.spacingXl),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.theme.primaryColor,
            primaryGradientEnd,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).onboardingAdhkarBalanceLabel,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    AnimatedBuilder(
                      animation: countUp,
                      builder: (context, _) {
                        final value = (countUp.value * 128).round();
                        return Text(
                          "+$value",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context).onboardingAdhkarBalanceHint,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.local_fire_department,
                    color: Colors.white, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: AnimatedBuilder(
              animation: countUp,
              builder: (context, _) {
                return CustomPaint(
                  painter: _SparklinePainter(progress: countUp.value),
                  size: Size.infinite,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: ConstantValues.spacingLg,
                vertical: ConstantValues.spacingMd),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).onboardingStreakPreview,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.trending_up_rounded,
                    color: Colors.white, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({required this.progress});

  final double progress;

  static const _points = [0.2, 0.35, 0.3, 0.5, 0.45, 0.7, 0.65, 1.0];

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final visibleCount =
        (progress * (_points.length - 1)).clamp(0, _points.length - 1);
    for (var i = 0; i <= visibleCount; i++) {
      final x = size.width * i / (_points.length - 1);
      final y = size.height * (1 - _points[i]);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    if (visibleCount > 0) {
      final lastIndex = visibleCount.floor();
      final x = size.width * lastIndex / (_points.length - 1);
      final y = size.height * (1 - _points[lastIndex]);
      canvas.drawCircle(Offset(x, y), 4, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
