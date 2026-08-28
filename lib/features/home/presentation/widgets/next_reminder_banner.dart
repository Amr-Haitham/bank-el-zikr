import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/notifications/domain/entities/prayer_times.dart';
import 'package:bank_el_ziker/features/notifications/presentation/cubit/prayer_times_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextReminderBanner extends StatelessWidget {
  const NextReminderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, RequestState<Settings>>(
      builder: (context, settingsState) {
        final settings = settingsState.whenOrNull(success: (s) => s);
        if (settings == null || !settings.adhkarRemindersEnabled) {
          return const SizedBox.shrink();
        }

        if (settings.reminderMode == 'auto') {
          return BlocBuilder<PrayerTimesCubit, RequestState<PrayerTimesEntity>>(
            builder: (context, prayerState) {
              if (prayerState is RequestStateInitial) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.read<PrayerTimesCubit>().fetch();
                });
              }
              final prayerTimes = prayerState.whenOrNull(success: (t) => t);
              if (prayerTimes == null) return const SizedBox.shrink();

              return _buildPill(
                context,
                morningEnabled: settings.morningReminderEnabled,
                eveningEnabled: settings.eveningReminderEnabled,
                morningTime: prayerTimes.fajr,
                eveningTime: prayerTimes.asr,
              );
            },
          );
        }

        return _buildPill(
          context,
          morningEnabled: settings.morningReminderEnabled &&
              settings.morningZikrAlarm != null,
          eveningEnabled: settings.eveningReminderEnabled &&
              settings.nightZikrAlarm != null,
          morningTime: settings.morningZikrAlarm == null
              ? null
              : _toDateTime(settings.morningZikrAlarm!),
          eveningTime: settings.nightZikrAlarm == null
              ? null
              : _toDateTime(settings.nightZikrAlarm!),
        );
      },
    );
  }

  Widget _buildPill(
    BuildContext context, {
    required bool morningEnabled,
    required bool eveningEnabled,
    required DateTime? morningTime,
    required DateTime? eveningTime,
  }) {
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();

    final candidates = <(String label, DateTime time)>[
      if (morningEnabled && morningTime != null)
        (l10n.morningAdhkar, _rollToFuture(morningTime, now)),
      if (eveningEnabled && eveningTime != null)
        (l10n.eveningAdhkar, _rollToFuture(eveningTime, now)),
    ];
    if (candidates.isEmpty) return const SizedBox.shrink();

    candidates.sort((a, b) => a.$2.compareTo(b.$2));
    final (label, time) = candidates.first;

    final duration = time.difference(now);
    final durationText = _formatDuration(context, duration);
    final timeText = _formatTime(context, TimeOfDay.fromDateTime(time));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: 14, vertical: ConstantValues.spacingMd),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_active_rounded,
              size: 16,
              color: context.theme.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.nextReminderText(label, durationText, timeText),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isArabic(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';

  String _digits(BuildContext context, Object value) =>
      _isArabic(context) ? ArabicNumbers().convert(value) : value.toString();

  String _formatTime(BuildContext context, TimeOfDay time) {
    final l10n = AppLocalizations.of(context);
    final hour12 = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final hourText = _digits(context, hour12);
    final minuteText = _digits(context, time.minute.toString().padLeft(2, '0'));
    final periodText = time.period == DayPeriod.am ? l10n.am : l10n.pm;
    return '$hourText:$minuteText $periodText';
  }

  DateTime _toDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  DateTime _rollToFuture(DateTime candidate, DateTime now) {
    return candidate.isAfter(now)
        ? candidate
        : candidate.add(const Duration(days: 1));
  }

  String _formatDuration(BuildContext context, Duration duration) {
    final l10n = AppLocalizations.of(context);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    if (hours <= 0) {
      return l10n.durationMinutes(_digits(context, duration.inMinutes));
    }
    if (minutes == 0) {
      return l10n.durationHours(_digits(context, hours));
    }
    return l10n.durationHoursMinutes(
      _digits(context, hours),
      _digits(context, minutes),
    );
  }
}
