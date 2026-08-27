import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/prayer_times.dart';
import 'package:bank_el_ziker/features/notifications/presentation/cubit/prayer_times_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/notification_toggle_card.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/reminder_time_card.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/reminder_timing_row.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/settings_segmented_row.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/settings_toggle_row.dart';
import 'package:bank_el_ziker/features/settings/presentation/widgets/time_picker_bottom_sheet.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    const SizedBox(height: 24),
                    Text(
                      l10n.notificationsSection,
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 12),
                    NotificationToggleCard(
                      title: l10n.adhkarReminders,
                      subtitle: settings.adhkarRemindersEnabled
                          ? (settings.reminderMode == 'auto'
                              ? l10n.adhkarRemindersSubtitleAuto
                              : l10n.adhkarRemindersSubtitleManual)
                          : null,
                      value: settings.adhkarRemindersEnabled,
                      onChanged: (value) async {
                        final succeeded = await context
                            .read<SettingsCubit>()
                            .setAdhkarRemindersEnabled(value);
                        if (!succeeded && value && context.mounted) {
                          context.showErrorNotification(
                            message: l10n.locationRequiredForReminders,
                          );
                        }
                      },
                    ),
                    if (settings.adhkarRemindersEnabled) ...[
                      const SizedBox(height: 12),
                      ReminderTimingRow(
                        isAuto: settings.reminderMode == 'auto',
                        timingLabel: l10n.timingLabel,
                        manualLabel: l10n.manualLabel,
                        autoLabel: l10n.autoLabel,
                        onChanged: (isAuto) {
                          final mode = isAuto ? 'auto' : 'manual';
                          context.read<SettingsCubit>().setReminderMode(mode);
                          if (isAuto) {
                            context.read<PrayerTimesCubit>().fetch();
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      if (settings.reminderMode == 'auto')
                        BlocBuilder<PrayerTimesCubit,
                            RequestState<PrayerTimesEntity>>(
                          builder: (context, prayerTimesState) {
                            if (prayerTimesState is RequestStateInitial) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) {
                                context.read<PrayerTimesCubit>().fetch();
                              });
                            }
                            final prayerTimes = prayerTimesState.whenOrNull(
                                success: (times) => times);
                            final fajrText = prayerTimes == null
                                ? '...'
                                : _formatTime(context, prayerTimes.fajr);
                            final asrText = prayerTimes == null
                                ? '...'
                                : _formatTime(context, prayerTimes.asr);
                            return Column(
                              children: [
                                ReminderTimeCard(
                                  icon: Icons.wb_sunny_outlined,
                                  iconColor: morningOrange,
                                  iconBgColor: context.theme.brightness ==
                                          Brightness.light
                                      ? morningBgLight
                                      : morningBgDark,
                                  label: l10n.morningAdhkar,
                                  timeText: '${l10n.fajr} $fajrText',
                                  enabled: settings.morningReminderEnabled,
                                  onToggle: (value) => context
                                      .read<SettingsCubit>()
                                      .setMorningReminderEnabled(value),
                                ),
                                const SizedBox(height: 12),
                                ReminderTimeCard(
                                  icon: Icons.nightlight_round,
                                  iconColor: eveningPurple,
                                  iconBgColor: context.theme.brightness ==
                                          Brightness.light
                                      ? eveningBgLight
                                      : eveningBgDark,
                                  label: l10n.eveningAdhkar,
                                  timeText: '${l10n.asr} $asrText',
                                  enabled: settings.eveningReminderEnabled,
                                  onToggle: (value) => context
                                      .read<SettingsCubit>()
                                      .setEveningReminderEnabled(value),
                                ),
                              ],
                            );
                          },
                        )
                      else ...[
                        ReminderTimeCard(
                          icon: Icons.wb_sunny_outlined,
                          iconColor: morningOrange,
                          iconBgColor: context.theme.brightness ==
                                  Brightness.light
                              ? morningBgLight
                              : morningBgDark,
                          label: l10n.morningAdhkar,
                          timeText: settings.morningZikrAlarm == null
                              ? '--:--'
                              : _formatTime(
                                  context, _toDateTime(settings.morningZikrAlarm!)),
                          enabled: settings.morningReminderEnabled,
                          onToggle: (value) => context
                              .read<SettingsCubit>()
                              .setMorningReminderEnabled(value),
                          onTap: () async {
                            final time = await TimePickerBottomSheet.show(
                              context,
                              title: l10n.morningAdhkar,
                              initialTime: settings.morningZikrAlarm ??
                                  const TimeOfDay(hour: 5, minute: 0),
                            );
                            if (time != null && context.mounted) {
                              context
                                  .read<SettingsCubit>()
                                  .setMorningAlarm(time);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        ReminderTimeCard(
                          icon: Icons.nightlight_round,
                          iconColor: eveningPurple,
                          iconBgColor: context.theme.brightness ==
                                  Brightness.light
                              ? eveningBgLight
                              : eveningBgDark,
                          label: l10n.eveningAdhkar,
                          timeText: settings.nightZikrAlarm == null
                              ? '--:--'
                              : _formatTime(
                                  context, _toDateTime(settings.nightZikrAlarm!)),
                          enabled: settings.eveningReminderEnabled,
                          onToggle: (value) => context
                              .read<SettingsCubit>()
                              .setEveningReminderEnabled(value),
                          onTap: () async {
                            final time = await TimePickerBottomSheet.show(
                              context,
                              title: l10n.eveningAdhkar,
                              initialTime: settings.nightZikrAlarm ??
                                  const TimeOfDay(hour: 18, minute: 40),
                            );
                            if (time != null && context.mounted) {
                              context
                                  .read<SettingsCubit>()
                                  .setNightAlarm(time);
                            }
                          },
                        ),
                      ],
                    ],
                  ] else
                    const Center(child: CircularProgressIndicator()),
                  if (kDebugMode) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Debug',
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 12),
                    SettingsToggleRow(
                      label: 'Replay onboarding',
                      value: false,
                      onChanged: (_) async {
                        await getService<SharedPreferences>()
                            .setBool('hasSeenOnboarding', false);
                        if (context.mounted) {
                          AutoRouter.of(context)
                              .replaceAll([const OnboardingRoute()]);
                        }
                      },
                    ),
                  ],
                  const SizedBox(height: ConstantValues.appBottomPadding),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  DateTime _toDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  String _formatTime(BuildContext context, DateTime dateTime) {
    final l10n = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    String digits(Object value) =>
        isArabic ? ArabicNumbers().convert(value) : value.toString();

    final timeOfDay = TimeOfDay.fromDateTime(dateTime);
    final hour12 = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final hourText = digits(hour12);
    final minuteText = digits(timeOfDay.minute.toString().padLeft(2, '0'));
    final periodText = timeOfDay.period == DayPeriod.am ? l10n.am : l10n.pm;
    return '$hourText:$minuteText $periodText';
  }
}
