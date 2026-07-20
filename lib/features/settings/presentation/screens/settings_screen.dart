import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/settings_segmented_row.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/settings_toggle_row.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _textSizes = ['small', 'medium', 'large'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ConstantValues.appHorizontalPadding),
          child: BlocBuilder<SettingsCubit, RequestState<Settings>>(
            builder: (context, state) {
              final settings = state.whenOrNull(success: (s) => s);

              return ListView(
                children: [
                  const SizedBox(height: ConstantValues.appTopPadding),
                  Center(
                    child: Text(
                      l10n.settingsTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (settings != null) ...[
                    SettingsToggleRow(
                      label: l10n.appTheme,
                      value: !settings.isLightTheme,
                      activeIcon: Icons.nightlight_round,
                      inactiveIcon: Icons.wb_sunny,
                      onChanged: (isDark) =>
                          context.read<SettingsCubit>().setTheme(!isDark),
                    ),
                    const SizedBox(height: 12),
                    SettingsToggleRow(
                      label: l10n.vibration,
                      value: settings.isVibrating,
                      onChanged: (value) =>
                          context.read<SettingsCubit>().setVibration(value),
                    ),
                    const SizedBox(height: 12),
                    SettingsSegmentedRow(
                      label: l10n.languageLabel,
                      options: const ["العربية", "English"],
                      selectedIndex: settings.selectedLanguage == 'en' ? 1 : 0,
                      onSelected: (index) => context
                          .read<SettingsCubit>()
                          .setLanguage(index == 1 ? 'en' : 'ar'),
                    ),
                    const SizedBox(height: 12),
                    SettingsSegmentedRow(
                      label: l10n.dhikrFont,
                      options: [l10n.clearFont, l10n.uthmaniFont],
                      optionFontFamilies: const ["Tajawal", "Cairo"],
                      optionFontSizes: const [14, 13],
                      selectedIndex: settings.dhikrFont == 'uthmani' ? 1 : 0,
                      onSelected: (index) => context
                          .read<SettingsCubit>()
                          .setDhikrFont(index == 1 ? 'uthmani' : 'clear'),
                    ),
                    const SizedBox(height: 12),
                    SettingsSegmentedRow(
                      label: l10n.textSize,
                      options: const ["A", "A", "A"],
                      optionFontSizes: const [12, 16, 20],
                      selectedIndex:
                          _textSizes.indexOf(settings.textSize).clamp(0, 2),
                      onSelected: (index) => context
                          .read<SettingsCubit>()
                          .setTextSize(_textSizes[index]),
                    ),
                    const SizedBox(height: 12),
                    SettingsSegmentedRow(
                      label: l10n.numerals,
                      options: const ["123", "١٢٣"],
                      selectedIndex: settings.useArabicNumerals ? 1 : 0,
                      onSelected: (index) => context
                          .read<SettingsCubit>()
                          .setUseArabicNumerals(index == 1),
                    ),
                  ] else
                    const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: ConstantValues.appBottomPadding),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
