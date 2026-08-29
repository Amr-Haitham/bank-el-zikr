import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_button.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class NotificationOptInStep extends StatefulWidget {
  const NotificationOptInStep({
    super.key,
    required this.onEnable,
    required this.onSkip,
  });

  final VoidCallback onEnable;
  final VoidCallback onSkip;

  @override
  State<NotificationOptInStep> createState() => _NotificationOptInStepState();
}

class _NotificationOptInStepState extends State<NotificationOptInStep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  late final Animation<double> _iconFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.4, curve: Curves.easeOut),
  );

  late final Animation<double> _iconScale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.5, curve: Curves.easeOutBack),
  );

  late final Animation<double> _textFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.7, curve: Curves.easeOut),
  );

  late final Animation<Offset> _textSlide = Tween(
    begin: const Offset(0, 0.15),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 0.7, curve: Curves.easeOutCubic),
  ));

  late final Animation<double> _buttonFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.6, 1, curve: Curves.easeOut),
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
            opacity: _iconFade,
            child: ScaleTransition(
              scale: _iconScale,
              child: _PulsingBellIcon(color: context.theme.primaryColor),
            ),
          ),
          const SizedBox(height: 28),
          FadeTransition(
            opacity: _textFade,
            child: SlideTransition(
              position: _textSlide,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context).onboardingNotificationTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context).onboardingNotificationSubtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!
                        .copyWith(fontSize: 15, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 2),
          FadeTransition(
            opacity: _buttonFade,
            child: Column(
              children: [
                CustomAppButton(
                  onPressed: widget.onEnable,
                  text: AppLocalizations.of(context)
                      .onboardingEnableNotifications,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(
                    AppLocalizations.of(context).onboardingSkipForNow,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.textTheme.bodySmall!.color!
                          .withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ConstantValues.appBottomPadding),
        ],
      ),
    );
  }
}

class _PulsingBellIcon extends StatefulWidget {
  const _PulsingBellIcon({required this.color});

  final Color color;

  @override
  State<_PulsingBellIcon> createState() => _PulsingBellIconState();
}

class _PulsingBellIconState extends State<_PulsingBellIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat();

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              _RingPulse(progress: _pulseController.value, color: widget.color),
              child!,
            ],
          );
        },
        child: Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            color: context.colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.notifications_active_rounded,
            size: 36,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}

class _RingPulse extends StatelessWidget {
  const _RingPulse({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = 76 + progress * 36;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withValues(alpha: (1 - progress) * 0.35),
          width: 2,
        ),
      ),
    );
  }
}
