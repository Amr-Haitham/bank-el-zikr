import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/onboarding/presentation/screens/components/app_purpose_step.dart';
import 'package:bank_el_ziker/features/onboarding/presentation/screens/components/language_step.dart';
import 'package:bank_el_ziker/features/notifications/data/failure/location_failure.dart';
import 'package:bank_el_ziker/features/onboarding/presentation/screens/components/notification_opt_in_step.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _stepCount = 3;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  String _selectedLanguage = 'ar';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _selectLanguage(String language) {
    setState(() => _selectedLanguage = language);
    _goToPage(1);
  }

  void _goBack() {
    _goToPage(_currentPage - 1);
  }

  Future<void> _completeOnboarding({bool enableNotifications = false}) async {
    final settingsCubit = context.read<SettingsCubit>();
    final failure = await settingsCubit.completeOnboardingWithNotifications(
      _selectedLanguage,
      enableNotifications: enableNotifications,
    );
    if (!mounted) return;

    if (failure != null) {
      final messenger = ScaffoldMessenger.of(context);
      final isServiceDisabled = failure is LocationFailure &&
          failure.reason == LocationFailureReason.serviceDisabled;
      final snackBar = context.buildSnackBar(
        failure.getDisplayMessage(context),
        type: SnackBarType.error,
        actionLabel:
            isServiceDisabled ? AppLocalizations.of(context).openSettingsAction : null,
        onAction: isServiceDisabled
            ? settingsCubit.openLocationSettingsScreen
            : null,
      );
      AutoRouter.of(context).replaceAll([const DashboardRoute()]);
      messenger.showSnackBar(snackBar);
    } else {
      AutoRouter.of(context).replaceAll([const DashboardRoute()]);
    }
  }

  Future<void> _enableNotifications() =>
      _completeOnboarding(enableNotifications: true);

  @override
  Widget build(BuildContext context) {
    final isArabic = _selectedLanguage == 'ar';
    return Localizations.override(
      context: context,
      locale: Locale(_selectedLanguage),
      child: Builder(
        builder: (context) {
          return Directionality(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 48,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _currentPage > 0
                            ? Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: IconButton(
                                  onPressed: _goBack,
                                  icon: const Icon(Icons.arrow_back_rounded),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          return PageView(
                            controller: _pageController,
                            onPageChanged: (page) =>
                                setState(() => _currentPage = page),
                            children: [
                              _ParallaxPage(
                                controller: _pageController,
                                index: 0,
                                child: LanguageStep(
                                  selectedLanguage: _selectedLanguage,
                                  onSelectLanguage: _selectLanguage,
                                ),
                              ),
                              _ParallaxPage(
                                controller: _pageController,
                                index: 1,
                                child: const AppPurposeStep(),
                              ),
                              _ParallaxPage(
                                controller: _pageController,
                                index: 2,
                                child: NotificationOptInStep(
                                  onEnable: _enableNotifications,
                                  onSkip: _completeOnboarding,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    _StepFooter(
                      currentPage: _currentPage,
                      onSkip: _currentPage == 1 ? () => _goToPage(2) : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ParallaxPage extends StatelessWidget {
  const _ParallaxPage({
    required this.controller,
    required this.index,
    required this.child,
  });

  final PageController controller;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var page = index.toDouble();
    if (controller.position.haveDimensions) {
      page = controller.page ?? index.toDouble();
    }
    final delta = (page - index).clamp(-1.0, 1.0);
    final opacity = (1 - delta.abs()).clamp(0.0, 1.0);
    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(delta * 40, 0),
        child: child,
      ),
    );
  }
}

class _StepFooter extends StatelessWidget {
  const _StepFooter({
    required this.currentPage,
    this.onSkip,
  });

  final int currentPage;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_stepCount, (index) {
              final isActive = index == currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? context.colors.primary
                      : context.colors.primary.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          if (onSkip != null) ...[
            const SizedBox(height: 12),
            TextButton(
              onPressed: onSkip,
              child: Text(
                AppLocalizations.of(context).onboardingNext,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: context.textTheme.bodySmall!.color!
                      .withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
