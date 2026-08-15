# Plan: Monthly Supporter Subscription via RevenueCat

Status: **Scoped — ready for implementation.** Supersedes the original "consumable tip tiers" framing below;
see Decision Log at the bottom for how scope changed from the initial ticket draft.

## What this is (and isn't)

This is a **monthly "Supporter" subscription** — a recurring, cancel-anytime auto-renewing subscription
that shows ongoing support for the developer. It is explicitly:

- **Not a one-time consumable tip.** The original plan draft scoped this as repeatable one-off "tip jar"
  purchases; that was changed (see Decision Log) to a single recurring subscription instead.
- **Not sadaqah / not a charitable donation.** This must be stated clearly and professionally in-app, in
  both languages — see Copy below. It is not tax-deductible and does not go to a charitable cause; it is a
  direct show of support for the app's continued development and upkeep.
- **Not tied to any perks or unlocked features.** Subscribing changes nothing functionally in the app.
  There is exactly one subscription tier, no feature-gating, no premium content.

Apple/Google both treat this as a standard auto-renewing subscription product — the standard, compliant
category for recurring in-app monetization on both platforms.

## Why RevenueCat instead of raw `in_app_purchase`

RevenueCat wraps StoreKit (iOS) and Google Play Billing (Android) — it doesn't replace App Store
Connect/Play Console product setup, it sits between the app and those purchase APIs to handle:

- Receipt validation
- Subscription status sync (active/expired/cancelled) and restoration across devices
- Cross-platform entitlement tracking (this app ships both iOS and Android)
- A dashboard for subscriber counts/revenue without building one

Free up to a revenue threshold (check RevenueCat's current pricing page at implementation time — this
changes), then a small percentage after. For a single low-price subscription tier, likely free-tier for a
long time.

## What needs to exist before any code is written

### 1. Apple Developer Program account
**Confirmed already enrolled** (paid, active) — not a blocker.

### 2. Google Play Developer account
Android is in scope for this feature. One-time $25 fee if not already registered — confirm current status
before starting Play Console setup.

### 3. RevenueCat account
Free to create. Needs to be linked to both App Store Connect and Play Console via API keys / service
account credentials — RevenueCat's dashboard walks through this per-store.

### 4. Subscription product — decided
- **One tier**: "Monthly Supporter" — no small/medium/large split, no preset-amount grid.
- **Price**: $1.99/month (or local equivalent — confirm store-side currency handling), auto-renewing.
- **No free trial / no intro offer** — starts billing immediately on subscribe, to avoid Apple defaulting
  any trial-period UX we haven't designed for.
- **No perks** — purely a support gesture, nothing unlocks.

## Store walkthroughs (to follow at implementation time)

### App Store Connect (iOS)
1. Apple Developer Program: already enrolled, skip.
2. In App Store Connect, create the app record if it doesn't already exist as a full listing (vs. just a
   dev-signing bundle ID).
3. Under the app → **Monetization → Subscriptions**, create a **Subscription Group** (required even for a
   single tier — Apple has no standalone non-grouped subscription product type). Within that group, create
   one **Auto-Renewable Subscription**: Product ID (e.g. `supporter_monthly_199`), reference name, a 1-month
   billing period, price tier (~$1.99 USD equivalent), and localized display name/description (Arabic +
   English).
4. Explicitly leave introductory offers/free trial unset.
5. Submit the subscription for review alongside the next app version.
6. Generate an **App Store Connect API key** (Users and Access → Integrations) for RevenueCat to pull
   subscription data server-side.

### Google Play Console (Android)
1. Confirm Play Developer registration status ($25 one-time if not already registered).
2. Create the app listing if it doesn't exist yet as a full store listing.
3. Under **Monetize → Products → Subscriptions**, create one subscription product (`supporter_monthly_199`),
   1-month billing period, base plan price ~$1.99 equivalent, localized name/description.
4. Generate a **Google Play service account** JSON key (Play Console → Setup → API access) for RevenueCat.

### RevenueCat setup
1. Create a RevenueCat account (app.revenuecat.com) and a new "Project" for this app.
2. Add the iOS app: link the bundle ID and paste in the App Store Connect API key from above.
3. Add the Android app: link the package name and paste in the Play service account key.
4. Create an **Entitlement** (e.g. `supporter`) granted by the `supporter_monthly_199` product on both stores.
5. Create an **Offering** (e.g. "default") containing a single **Package** mapping to `supporter_monthly_199`
   on both platforms.
6. Get the RevenueCat **public SDK API key** (separate per platform) for the Flutter app config — store API
   keys stay server-side in RevenueCat's dashboard, never shipped in the app.

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

New feature folder: `lib/features/donations/`, replacing `SupportAppCardWidget`
(`lib/features/home/presentation/widgets/support_app_card_widget.dart`), which currently just opens
`ThirdPartyValues.paypalLink` externally via `url_launcher` — that external-link call is deleted entirely,
along with the now-unused `paypalLink` constant.

```
lib/features/donations/
  data/
    datasources/
      revenuecat_donation_datasource.dart   # wraps purchases_flutter calls: getOfferings, purchasePackage,
                                              # restorePurchases, getCustomerInfo
    repositories/
      donation_repository_impl.dart
  domain/
    entities/
      supporter_status.dart                  # isActive: bool — derived from the `supporter` entitlement
    repositories/
      donation_repository.dart
    usecases/
      get_supporter_status.dart               # read current entitlement state (e.g. on app start / screen
                                                # load)
      subscribe.dart                          # trigger purchase of the single supporter_monthly_199 package
      restore_purchases.dart                  # re-sync entitlement from the stores
  presentation/
    cubit/
      supporter_status_cubit.dart             # RequestCubit<SupporterStatus>, registerLazySingleton —
                                                # subscription state must be consistent between the home
                                                # screen card and anywhere else it's read, per this repo's
                                                # DI rule for cross-screen-shared state
    screens/
      components/
        support_app_card_widget.dart          # replaces the existing widget in place, same home-screen
                                                # position; renders either the "Support the Developer" CTA
                                                # or the subscribed state depending on SupporterStatusCubit
```

- `purchases_flutter` (RevenueCat's official Flutter SDK) is the new pubspec dependency — needs adding,
  not yet present.
- `SupporterStatusCubit` is a **singleton** (`registerLazySingleton`), not a factory — its state must stay
  consistent if the supporter card and any other surface (e.g. a settings screen entry) both read it,
  per this repo's DI rule (see root `CLAUDE.md` → Dependency injection).
- No mapper needed: `SupporterStatus` is a two-field derived read (`isActive`) computed directly from
  RevenueCat's `CustomerInfo.entitlements` response in the datasource/repository — there's no persisted
  data model on the other side of it to map from, so the mapper rule doesn't apply here.
- No Hive persistence — subscription state is tracked by RevenueCat/App Store/Play Store, not locally.

## Home screen integration

The existing `SupportAppCardWidget` is replaced in place (same position in `home_screen.dart`'s
`SliverList`, between `VerseOfDayCardWidget` and `ShareRewardRow`) with a new widget of the same name
under `lib/features/donations/presentation/screens/components/`, driven by `SupporterStatusCubit`:

- **Not subscribed**: card shows the "Support the Developer" CTA, tapping it opens the subscribe flow
  (a confirmation sheet or screen — TBD at implementation time, likely a simple bottom sheet given there's
  only one tier and no tier-picker UI needed) and completes the RevenueCat purchase.
- **Subscribed**: card shows a muted/disabled state — "You're supporting this app 💚 · Manage Subscription"
  — tapping it deep-links to the platform's native subscription management (iOS: App Store subscription
  settings; Android: Play Store subscription settings), not a custom cancel/manage UI built in-app.

## Copy (English / Arabic)

Must clearly and professionally state this is **not** sadaqah/charitable giving and **not** tax-deductible
— this is both a policy-correctness requirement (Apple's IAP framing) and a trust requirement (users must
not think this is religious giving).

**English**
- CTA button (not subscribed): "Support the Developer"
- Sheet/screen title: "Support Bank El Zikr"
- Body copy: "This is a monthly show of support for the developer — not a religious donation (sadaqah) and
  not tax-deductible. It simply helps keep this app free and maintained."
- Product display name: "Monthly Supporter" — $1.99/month
- Subscribed state: "You're supporting this app 💚 · Manage Subscription"

**Arabic**
- CTA button: "ادعم المطوّر"
- Title: "ادعم بنك الذكر"
- Body: "هذا دعم شهري رمزي للمطوّر، وليس صدقة أو تبرعًا خيريًا، ولا يُعد تبرعًا معفى من الضريبة. هدفه فقط
  الإبقاء على التطبيق مجانيًا ومستمرًا في التطوير."
- Product display name: "داعم شهري" — ١.٩٩ دولار شهريًا
- Subscribed state: "أنت تدعم هذا التطبيق 💚 · إدارة الاشتراك"

Both ARB files (`lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`) need new keys for all of the above; the
existing `donate`/`supportTheApp` keys are superseded and should be removed once the new widget ships (grep
for any other usage of those keys before deleting).

## Restoration behavior

"Purchase restoration" for a subscription means re-syncing entitlement status from the store, not
re-granting a consumed item. `restore_purchases.dart` calls `Purchases.restorePurchases()` and updates
`SupporterStatusCubit` from the resulting `CustomerInfo`. This matters most when a user reinstalls the app
or switches devices under the same Apple/Google account — their subscribed state should reappear without
re-purchasing.

## Decision log

Original ticket draft (BR-32) and the first version of this plan scoped **consumable, repeatable one-time
tip tiers** (e.g. 3 tiers at $1.99/$4.99/$9.99, "tip jar" framing). Working through the open questions with
the developer changed this to the scope described above:

- Apple Developer Program: confirmed already enrolled (not a blocker).
- Platform scope: iOS **and** Android both in scope for v1 (not iOS-only).
- Purchase model: **single monthly auto-renewing subscription** ($1.99/mo), not consumable tips — no tier
  grid, no preset custom-amount list.
- No perks tied to subscribing.
- Explicit requirement: copy must clearly state this is support, not sadaqah, and not tax-deductible.
- Naming shifted from "tip jar" to "Supporter" language throughout, to match a subscription rather than a
  one-off purchase.

If tip-jar-style one-time purchases are wanted later, that would be a separate, additive feature (a second
Offering/Package in RevenueCat, a second entitlement or none), not a modification of this one.
