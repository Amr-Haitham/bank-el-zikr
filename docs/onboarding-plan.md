# Plan: Lean 3-Screen Onboarding Flow

Status: **Not started — planning only.** This document scopes the feature; implementation happens in a
later PR.

## What exists today

`lib/features/onboarding/presentation/screens/onboarding_screen.dart` is currently a **single screen**: a
language picker (Arabic/English) that calls `SettingsCubit.completeOnboarding(language)` and routes
straight to `DashboardRoute`. It's shown unconditionally right now — `main.dart` passes
`AppRouter(showOnboarding: true)` with a `// TODO revert: !hasSeenOnboarding` comment, meaning the
"only show once" logic is currently disabled/stubbed, not wired to actual first-launch detection. That
TODO needs resolving as part of this work regardless of scope.

## Design principle: lean, not a feature tour

Every additional onboarding screen is a chance to lose a user before they've felt the app's value —
onboarding tutorials with a full feature-by-feature walkthrough tend to get skipped or abandoned, and
adhkar counting/reading is largely self-explanatory once someone is in the app. Rather than a generic
"here's button A, here's button B" tour, this plan uses the onboarding screen budget for the two things
that actually need a *moment*, not an explanation:

1. Language (fork in RTL/LTR experience — already built)
2. A one-line "why this app exists" framing (hasanat/streak positioning — emotional context, not a UI
   tutorial)
3. Notification opt-in (the natural place to ask, at peak goodwill, for the reminder feature planned in
   [[notifications-plan]] / BR-31 — better than interrupting later with a cold permission prompt)

No coach-marks/tooltip overlays pointing at in-app buttons — those have poor completion rates and break
every time a screen's layout changes, becoming a maintenance tax with little payoff.

**Every step must be skippable.** A visible "Skip" (or "Skip for now" on the notification step
specifically, since permission prompts should never feel mandatory) on each screen — onboarding is
scaffolding for users who want it, not a gate for users who already know what they want.

## Scope for v1

Three screens, in order:

1. **Language** (existing `OnboardingScreen` content, unchanged) — Arabic/English picker.
2. **App purpose / hasanat framing** — a short, warm explanation of what the app tracks and why (hasanat
   balance, streaks) — copy TBD, see Open Questions.
3. **Notification opt-in** — surfaces the Sabah/Masaa' reminder feature from BR-31 and asks for
   notification (and, if needed, location) permission right here, with a clear "Skip for now" that leaves
   the feature available later via Settings rather than lost.

Then routes to `DashboardRoute`, same as today.

## Dependency on BR-31 (notifications)

Screen 3 assumes the notification preferences feature ([[notifications-plan]]) exists enough to call into
— specifically `NotificationPreferencesCubit`'s enable/permission-request flow. If BR-31 isn't built yet
when this is implemented, screen 3 either needs to be deferred (ship 2 screens now, add the 3rd once BR-31
lands) or built in tandem. Flagging this as a sequencing decision, not assuming BR-31 ships first.

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

This extends the existing `lib/features/onboarding/` feature rather than introducing a new one:

```
lib/features/onboarding/
  presentation/
    screens/
      onboarding_route.dart              # existing, unchanged (wraps in MultiBlocProvider)
      onboarding_screen.dart              # becomes a PageView/step controller across 3 pages
      components/
        language_step.dart                 # existing language picker content, extracted as-is
        app_purpose_step.dart               # new
        notification_opt_in_step.dart       # new, reads/writes NotificationPreferencesCubit (BR-31)
```

- No new domain/data layer needed for the onboarding flow itself — it orchestrates existing cubits
  (`SettingsCubit` for language, `NotificationPreferencesCubit` for the opt-in step) rather than owning new
  state.
- The `showOnboarding` / `hasSeenOnboarding` gating logic in `main.dart` needs fixing as part of this work
  — currently hardcoded `true` with an unresolved TODO. Should read a persisted "has completed onboarding"
  flag (likely already implied by `Settings` having a language set, or a dedicated flag on `Settings` /
  `SettingsCubit` — needs checking which already exists vs. needs adding).
- Step navigation: a `PageView` with a page indicator, "Back"/"Skip"/"Next" controls per step, "Skip"
  bypasses remaining steps and completes onboarding immediately (still saves whatever was chosen so far,
  e.g. language).

## Open questions for you before implementation starts

1. **"Why this app" screen copy** — what's the actual framing? (e.g. "track your daily adhkar and build a
   lasting habit" — needs your voice, not a placeholder we invent)
2. **Does "Skip" on the notification step mean "ask me later" or "don't ask again unless I go to
   Settings"?** Affects whether this step's skip interacts with BR-33/BR-34's prompt-cooldown system or is
   fully independent.
3. **Fix the `hasSeenOnboarding` TODO as part of this ticket, or is that tracked separately already?**
   (It's currently blocking onboarding from ever being skipped for returning users — a real bug, not just
   cleanup.)
4. **Visual style for steps 2 and 3** — reuse the existing language screen's visual language (card-based
   options, centered logo) for consistency, or something more illustrative (icons/simple graphics per
   step)?
