# Plan: Local Adhkar Reminder Notifications

Status: **Not started — planning only.** This document scopes the feature; implementation happens in a
later PR.

## Goal

Let users get a local notification reminding them to read Sabah (morning) and Masaa' (evening) adhkar,
at times that are either auto-calculated from prayer times or set manually. Fully local — no server, no
push infrastructure, no recurring cost.

## Why local, not push

Sabah/Masaa' adhkar times are tied to Fajr and Maghrib, which are deterministic given date + location —
they don't need a server round-trip. `flutter_local_notifications` schedules OS-level local notifications
that fire even if the app is closed, with no backend involved. This is already a commented-out line in
`pubspec.yaml` (`# flutter_local_notifications: ^17.2.2`), suggesting it was considered before.

## Prayer time source

Use a local astronomical calculation package (e.g. `adhan_dart`, a Dart port of the widely-used Adhan
library) rather than an external API (e.g. Aladhan). Fully offline after the device's location is known,
matches this app's local-first/Hive-based architecture, and avoids adding a network failure mode for
something that's fully computable on-device.

- **Sabah** reminder anchors to **Fajr**.
- **Masaa'** reminder anchors to **Maghrib** (confirm with user — Asr is the alternative convention some
  apps use for "evening"; Maghrib is more common for a "Masaa' adhkar" framing).
- **Calculation method**: needs a default (e.g. Egyptian General Authority of Survey, given the app's
  Arabic-primary content) — open question, see Open Questions below.

## Location permission

Requested once, with a clear rationale string ("to calculate accurate Sabah/Masaa' times for your
location"). Two fallback paths if denied or unavailable:

- User falls back to **manual time entry** (feature stays usable, just not auto-calculated).
- If auto-calculated times were previously set and location becomes unavailable (e.g. permission revoked
  later), keep the last-known calculated time rather than silently disabling notifications.

## Scope for v1

- Master toggle: "Adhkar reminders" on/off in Settings.
- Per-category toggle: Sabah and Masaa' independently enabled/disabled (mirrors the existing
  `morningCompleted` / `eveningCompleted` split already tracked on `DayRecord`).
- Per-category time: auto-calculated by default, with manual override available per category.
- No snooze, no repeat customization (daily only), no custom notification sound in v1.

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

New feature folder: `lib/features/notifications/` (its own feature, not bolted onto `settings`, since it
has its own domain logic — prayer time calculation, permission handling, OS scheduling — even though its
UI surface lives inside the Settings screen).

```
lib/features/notifications/
  data/
    datasources/
      notification_scheduler_local_datasource.dart   # wraps flutter_local_notifications calls
      prayer_time_local_datasource.dart               # wraps adhan_dart calculation
    models/
      notification_preferences_model.dart             # Hive model (see below)
      notification_preferences_mapper.dart
    repositories/
      notification_repository_impl.dart
  domain/
    entities/
      notification_preferences.dart                   # enabled flags, times, auto/manual mode per category
    repositories/
      notification_repository.dart
    usecases/
      get_notification_preferences.dart
      update_notification_preferences.dart
      schedule_adhkar_reminders.dart                   # recalculates + reschedules both categories
      request_location_permission.dart
  presentation/
    cubit/
      notification_preferences_cubit.dart              # RequestCubit<NotificationPreferences>, singleton
                                                          # (read on Settings screen, written from same screen)
    screens/components/
      adhkar_reminder_settings_section.dart             # embedded into existing settings_screen.dart
```

- New Hive model `NotificationPreferences`, **typeId 8** (next free — current registry: 0 Zikr, 2
  GeneralData, 4 Prayer, 5 Version, 6 DayRecord, 7 ReadingProgress; 1 is legacy-migration-only). Register
  in `hive_db.dart` per the existing pattern.
- Mapper follows the existing `<Model>Mapper` static-class rule (`NotificationPreferencesMapper`).
- `NotificationPreferencesCubit` is a `registerLazySingleton` (state must stay consistent between the
  Settings screen and wherever else might read it, e.g. a future "next reminder" home-screen chip) —
  matches this repo's DI rule for shared-state cubits.
- Settings screen integration follows the existing `SettingsToggleRow` / `SettingsSegmentedRow` widget
  patterns already used in `settings_screen.dart`, not new one-off widgets.
- Actual OS scheduling (via `flutter_local_notifications`) is triggered from `schedule_adhkar_reminders`
  use case, called whenever preferences change and once on app launch (to handle day-rollover /
  DST-shifted recalculation) — needs a place to hook the "on launch" trigger, likely `main.dart` after DI
  setup, or a dedicated init call from `HiveDB`/service locator bootstrap.

## Platform setup needed

- **iOS**: request notification permission (`UNUserNotificationCenter`), add `NSLocationWhenInUseUsageDescription`
  string to `Info.plist` (location permission prompt copy), handle notification permission via
  `flutter_local_notifications`'s iOS setup.
- **Android**: `POST_NOTIFICATIONS` permission (Android 13+), exact-alarm scheduling permission
  considerations (`SCHEDULE_EXACT_ALARM` on Android 12+) since adhkar reminders need to fire at a precise
  time, not just "approximately."

## Open questions for you before implementation starts

1. **Masaa' anchor**: Maghrib or Asr?
2. **Default calculation method**: Egyptian General Authority (matches Arabic-primary audience
   assumption), or another (Umm al-Qura, MWL, ISNA)? Should this itself be user-configurable, or fixed?
3. **Notification copy**: what should the notification title/body actually say (Arabic primary, English
   secondary per existing l10n pattern)?
4. **Should the "next reminder" time show anywhere in the UI** (e.g. a chip on Home), or is Settings-only
   sufficient for v1?
