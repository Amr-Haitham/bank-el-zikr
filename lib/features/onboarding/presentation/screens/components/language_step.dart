import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

class LanguageStep extends StatefulWidget {
  const LanguageStep({
    super.key,
    required this.selectedLanguage,
    required this.onSelectLanguage,
  });

  final String selectedLanguage;
  final ValueChanged<String> onSelectLanguage;

  @override
  State<LanguageStep> createState() => _LanguageStepState();
}

class _LanguageStepState extends State<LanguageStep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..forward();

  late final Animation<double> _logoScale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.5, curve: Curves.easeOutBack),
  );

  late final Animation<double> _contentFade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
  );

  late final Animation<Offset> _contentSlide = Tween(
    begin: const Offset(0, 0.12),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 0.7, curve: Curves.easeOutCubic),
  ));

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
          ScaleTransition(
            scale: _logoScale,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FadeTransition(
            opacity: _contentFade,
            child: SlideTransition(
              position: _contentSlide,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "اختر لغتك",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: context.textTheme.headlineSmall!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Choose your language",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.textTheme.bodySmall!.color!
                          .withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _LanguageOption(
                    isSelected: widget.selectedLanguage == 'ar',
                    onTap: () => widget.onSelectLanguage('ar'),
                    mainLabel: "العربية",
                    mainLabelDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 14),
                  _LanguageOption(
                    isSelected: widget.selectedLanguage == 'en',
                    onTap: () => widget.onSelectLanguage('en'),
                    mainLabel: "English",
                    mainLabelDirection: TextDirection.ltr,
                    subtitle: "Adds translation & transliteration",
                    boldOnLeft: true,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 3),
          Text(
            "Change it anytime in Settings",
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall!.copyWith(
              color: context.textTheme.bodySmall!.color!.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "يمكنك تغييرها لاحقًا من الإعدادات",
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: context.textTheme.labelSmall!.copyWith(
              color: context.textTheme.bodySmall!.color!.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.isSelected,
    required this.onTap,
    required this.mainLabel,
    required this.mainLabelDirection,
    this.subtitle,
    this.boldOnLeft = false,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String mainLabel;
  final TextDirection mainLabelDirection;
  final String? subtitle;
  final bool boldOnLeft;

  @override
  Widget build(BuildContext context) {
    final boldColumn = Column(
      textDirection: TextDirection.ltr,
      crossAxisAlignment:
          boldOnLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          mainLabel,
          textDirection: mainLabelDirection,
          style: context.textTheme.titleMedium!
              .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ],
    );

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.primaryColor.withValues(alpha: 0.08)
              : context.theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? context.theme.primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: boldOnLeft
              ? [boldColumn, _SelectionIndicator(isSelected: isSelected)]
              : [_SelectionIndicator(isSelected: isSelected), boldColumn],
        ),
      ),
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  const _SelectionIndicator({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1 : 0,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutBack,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, size: 14, color: Colors.white),
      ),
    );
  }
}
