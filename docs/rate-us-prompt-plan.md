# Plan: Rate-Us Prompt

Status: **Not started — planning only.** This document scopes the feature; implementation happens in a
later PR.

## Goal

Periodically ask engaged users to rate the app on the App Store / Google Play, without being annoying:
respects a "never ask again" dismissal, and doesn't nag on every launch.

## Design principles (the "not annoying" part)

- **Never ask again is permanent** — once dismissed with that explicit choice, store it and never show the
  prompt again, full stop. Not "ask again in a year," gone for good.
- **Don't ask on first launch or first few sessions** — the user hasn't formed an opinion yet. Trigger
  only after some sign of genuine engagement (see Trigger conditions below).
- **Don't ask if they just said no** — a plain "not now" (as opposed to "never ask again") should still
  back off for a meaningful cooldown period, not reappear next session.
- **Don't stack with other soft-asks** — this repo is also planning a donation popup
  ([[donations-popup-plan]]) and notification permission requests ([[notifications-plan]]). These should
  not all compete for the user's attention in the same session. See Cross-Cutting Prompt Policy below.
- **Prefer the OS-native review prompt over a custom dialog where possible** — iOS's
  `SKStoreReviewController` / Android's Play In-App Review API let the OS show its own lightweight rating
  UI without leaving the app, and Apple in particular rate-limits how often your app is even allowed to
  trigger it (roughly 3x per 365 days, OS-enforced) — meaning some of the "don't be annoying" enforcement
  is already handled by the platform itself, not just your own logic.

## Trigger conditions (needs your input — see Open Questions)

Candidate signal for "this user is engaged, a good moment to ask": e.g. after completing N days of a
streak (`JourneyStats` already computes streak data — see
`lib/features/azkar_records/domain/entities/journey_stats.dart`), or after N total app opens, or after
completing a full adhkar reading session. Exact trigger is an open question below, not decided here.

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

This is a cross-cutting concern more than a "feature" with its own screens — likely lives partly in
`core/` (the reusable prompt-eligibility logic) and partly hooks into existing feature completion points
(e.g. `azkar_records`, where streaks are computed).

```
lib/core/layers/data/services/
  review_prompt_service.dart          # wraps in_app_review (or store_redirect) package calls,
                                        # exposes requestReview() / canRequestReview()

lib/features/settings/... (or a new lib/features/engagement/ if this + donation popup share logic)
  data/
    models/
      prompt_state_model.dart          # Hive model: lastShownAt, neverAskAgain, dismissCount, per-prompt-type
      prompt_state_mapper.dart
    repositories/
      prompt_state_repository_impl.dart
  domain/
    entities/
      prompt_state.dart
    repositories/
      prompt_state_repository.dart
    usecases/
      should_show_rate_prompt.dart      # encodes the "not annoying" eligibility rules
      record_rate_prompt_dismissed.dart # persists never-ask-again or cooldown timestamp
  presentation/
    cubit/
      rate_prompt_cubit.dart
```

- New Hive model for prompt state, next free **typeId 9** (assuming [[donations-popup-plan]]'s prompt
  state takes 8, or share one model/typeId for both prompt types with a `promptType` field — see Open
  Questions, this affects whether rate-us and donation-popup should share one `PromptState` model or have
  separate ones).
- `in_app_review` (pub.dev package) is the likely dependency for triggering the native OS review prompt —
  not yet in `pubspec.yaml`, needs adding.
- Eligibility check (`should_show_rate_prompt`) should be a pure use case, callable from wherever a
  "good moment" occurs (e.g. after `DayRecordCubit` records a completed day, or wherever streak
  completion is detected) — not tied to a specific screen's lifecycle.

## Cross-Cutting Prompt Policy

Because this app will soon have multiple soft-ask prompts (rate-us, donation popup, and a notification
permission request), there should be one shared rule: **only one soft-ask prompt per app session, and a
minimum cooldown between any two prompts regardless of type.** This needs a shared coordinator (e.g. a
`PromptCoordinator` or similar in `core/`) that all three consult before showing themselves, rather than
each feature deciding independently and risking two prompts firing back to back. This is flagged here as a
recommendation, not yet decided — see Open Questions.

## Open questions for you before implementation starts

1. **Exact trigger condition**: streak length (e.g. 7-day streak), total opens, completed readings, or a
   combination?
2. **Cooldown length** for a plain "not now" dismissal before asking again (e.g. 30 days, 90 days)?
3. **Should rate-us and the donation popup share one `PromptState`/coordinator system**, or stay fully
   independent? (Recommended: shared, to enforce "only one soft-ask per session" — see Cross-Cutting
   Prompt Policy above.)
4. **Native OS review prompt (`in_app_review`) vs. a custom in-app dialog** that links out to the store
   listing directly? Native is recommended (frictionless, OS rate-limited) but confirm.
