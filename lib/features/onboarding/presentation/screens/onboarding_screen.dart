import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selectedLanguage = 'ar';

  void _selectLanguage(String language) {
    setState(() => _selectedLanguage = language);
    context.read<SettingsCubit>().completeOnboarding(language);
    AutoRouter.of(context).replaceAll([const DashboardRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ConstantValues.appHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Center(
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
              const SizedBox(height: 24),
              Text(
                "اختر لغتك",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                "Choose your language",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 32),
              _LanguageOption(
                isSelected: _selectedLanguage == 'ar',
                onTap: () => _selectLanguage('ar'),
                smallLabel: "Arabic",
                mainLabel: "العربية",
                mainLabelDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 14),
              _LanguageOption(
                isSelected: _selectedLanguage == 'en',
                onTap: () => _selectLanguage('en'),
                smallLabel: "الإنجليزية",
                mainLabel: "English",
                mainLabelDirection: TextDirection.ltr,
                subtitle: "Adds translation & transliteration",
              ),
              const Spacer(flex: 3),
              Text(
                "Change it anytime in Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "يمكنك تغييرها لاحقًا من الإعدادات",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: ConstantValues.appBottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.isSelected,
    required this.onTap,
    required this.smallLabel,
    required this.mainLabel,
    required this.mainLabelDirection,
    this.subtitle,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String smallLabel;
  final String mainLabel;
  final TextDirection mainLabelDirection;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              smallLabel,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .color!
                    .withValues(alpha: 0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  mainLabel,
                  textDirection: mainLabelDirection,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
