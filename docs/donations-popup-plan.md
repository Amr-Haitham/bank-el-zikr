# Plan: Donation/Tip Popup Prompt

Status: **Not started — planning only.** This document scopes the *prompt* (when/how to surface the ask);
the underlying purchase mechanics are scoped separately in [[donations-plan]] (the RevenueCat IAP setup).
This doc assumes that feature exists and focuses on the popup that invites users to it.

## Goal

Periodically invite users to tip, without being pushy — same "never ask again" respect as the rate-us
prompt ([[rate-us-prompt-plan]]), but potentially recurring (e.g. shown again after a longer interval, not
permanently gone after one dismissal) since a donation ask reasonably differs from a rating ask: someone
who declines to tip today might genuinely want to next month, whereas "no thanks" to rating is usually
final.

## Design principles

- **"Never ask again" is permanent**, same as rate-us — an explicit opt-out must be respected forever, not
  just for a season.
- **"Not now" allows periodic re-asking** — this is the one place this prompt differs from rate-us. Needs
  a defined interval (see Open Questions) rather than showing every session.
- **Never stack with the rate-us prompt or a notification permission ask in the same session** — see
  Cross-Cutting Prompt Policy in [[rate-us-prompt-plan]], which this should share.
- **Trigger on a positive moment**, not randomly — e.g. after completing a streak milestone, similar
  reasoning to rate-us's trigger condition.
- **Should probably not be the very first prompt a new user sees** — asking for money before someone has
  even used the app meaningfully reads as aggressive monetization; needs a minimum engagement bar before
  first eligibility (exact bar: Open Question).

## Relationship to the rate-us prompt

These two prompts are similar enough in shape (soft-ask, dismissible, periodic, engagement-gated) that
they likely share the same underlying `PromptState`/coordinator infrastructure described in
[[rate-us-prompt-plan]]'s architecture section, differentiated by a `promptType` field (`rateUs` vs.
`donation`) rather than being two entirely separate systems. This avoids duplicating the "don't stack
prompts" logic in two places.

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

Builds on the same `core` prompt infrastructure as [[rate-us-prompt-plan]] — see that doc's Architecture
section for the shared `PromptState` Hive model / coordinator shape. This feature adds:

```
lib/features/donations/
  presentation/
    widgets/
      donation_prompt_dialog.dart      # the actual popup UI, links into the donation_screen/route
                                         # from donations-plan.md when the user taps "tip"
    cubit/
      donation_prompt_cubit.dart        # decides eligibility (reuses should_show_donation_prompt usecase),
                                          # exposes show/dismiss/neverAskAgain actions
  domain/
    usecases/
      should_show_donation_prompt.dart  # mirrors should_show_rate_prompt's shape, different interval rules
      record_donation_prompt_dismissed.dart
```

- Reuses the `PromptState` Hive model from [[rate-us-prompt-plan]] (shared typeId, `promptType` field) —
  no new typeId needed if built after/alongside that doc's implementation, assuming that's built first.
- The popup itself should link directly into whatever UI [[donations-plan]] defines for the actual tip
  flow (a screen or bottom sheet) rather than duplicating tier selection inside the prompt dialog itself —
  the prompt's only job is "ask if they're interested," not to also render tip tiers.

## Open questions for you before implementation starts

1. **Re-ask interval for "not now"** — how long before the donation prompt can reappear (e.g. 60 days, 90
   days)? Needs to feel infrequent, not nagging.
2. **Trigger condition** — same streak/engagement signal as rate-us, or a different one (e.g. only after
   using the app for N total days, regardless of streak continuity)?
3. **Minimum engagement bar before first eligibility** — e.g. no donation prompt before day 7 of use?
4. **Should "never ask again" on the donation prompt also suppress it from appearing anywhere else** (e.g.
   if there's a persistent donate button elsewhere in the UI, does opting out of the *popup* affect that
   button's visibility, or are they independent)? Recommended: independent — never-ask-again should only
   suppress the interruptive popup, not remove the option to donate entirely from a menu/settings location.
5. **Does this share one coordinator with rate-us** (recommended, per [[rate-us-prompt-plan]]'s
   Cross-Cutting Prompt Policy) — confirming this before implementation avoids building two competing
   systems.
