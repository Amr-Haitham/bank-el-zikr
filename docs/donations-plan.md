# Plan: Tip/Donation Feature via RevenueCat

Status: **Not started — planning only.** This document scopes the feature; implementation happens in a
later PR. Currently the app has a donate button that likely just links out externally — this plan replaces
that with an in-app purchase flow.

## What this is (and isn't)

This is a **"support the developer" tip jar** — one-time purchases of digital "tip" tiers, not charitable
donations to a cause. That framing matters for policy reasons (see below): Apple treats this as
purchasable digital content, which is the category IAP is built for and which Apple requires for this kind
of in-app monetization. If this were ever reframed as pass-through charitable donations, the compliant
approach would look different (typically an external payment link, since Apple restricts/exempts
charitable giving from the standard 30% IAP cut under certain conditions) — that is explicitly **not**
what this plan covers.

## Why RevenueCat instead of raw `in_app_purchase`

RevenueCat wraps StoreKit (iOS) and Google Play Billing (Android) — it doesn't replace App Store
Connect/Play Console product setup, it sits between the app and those purchase APIs to handle:

- Receipt validation
- Purchase restoration
- Cross-platform entitlement tracking (relevant if this app ever ships on Android too)
- A dashboard for tip revenue/analytics without building one

Free up to a revenue threshold (check RevenueCat's current pricing page at implementation time — this
changes), then a small percentage after. For a tip jar on an app this size, likely free-tier for a long
time.

## What needs to exist before any code is written

This is the part that needs you, not just implementation:

### 1. Apple Developer Program account
Paid, $99/year. Required for any IAP product, separate from just being able to build/run the app on your
own device (which only needs a free Apple ID + local signing, already working). Confirm whether you
already have this — if you've only ever run the app via free personal-team signing (as we set up during
device deployment), this is a **new** requirement, not something already satisfied.

### 2. Google Play Developer account (if/when Android ships)
One-time $25 fee. Only needed if tips should also work on Android — confirm whether Android is in scope
for this feature's first release or iOS-only for now.

### 3. RevenueCat account
Free to create. Needs to be linked to the App Store Connect (and Play Console, if applicable) account
above via API keys / app-specific shared secrets — RevenueCat's dashboard walks through this per-store.

### 4. Tip tier products — needs your decision
Apple/Google require each purchasable tier to be defined as a distinct product with its own ID, price,
and display name in App Store Connect / Play Console, then mirrored as an "offering" in RevenueCat. This
plan cannot proceed to implementation without you specifying:

- **How many tiers** (e.g. 3: small/medium/large?)
- **Price per tier** (e.g. $1.99 / $4.99 / $9.99 — or different amounts)
- **Display names** (e.g. "Coffee ☕" / "Meal 🍽️" / "Generous Support 🌟" — or simpler "Small Tip" /
  "Medium Tip" / "Large Tip")
- **Consumable vs. non-consumable**: tips should almost certainly be **consumable** (can be purchased
  repeatedly — someone can tip multiple times), not non-consumable (one-time-ever purchase) or subscription.

This is flagged as an explicit open question, not a default — see Open Questions below.

## Store walkthroughs (to follow at implementation time)

### App Store Connect (iOS)
1. Enroll in Apple Developer Program if not already (developer.apple.com/programs, $99/yr).
2. In App Store Connect, create the app record if it doesn't already exist as a full listing (vs. just a
   dev-signing bundle ID).
3. Under the app → **Monetization → In-App Purchases**, create one **Consumable** product per tip tier.
   Each needs: a Product ID (e.g. `tip_small`, `tip_medium`, `tip_large`), reference name, price tier,
   and localized display name/description (Arabic + English, matching this app's l10n setup).
4. Submit IAP products for review alongside the next app version (new IAP products can't go live
   independently of an app binary review in most cases).
5. Generate an **App Store Connect API key** (Users and Access → Integrations) for RevenueCat to pull
   subscription/purchase data server-side.

### Google Play Console (Android, if in scope)
1. Register as a Google Play developer if not already ($25 one-time, console.play.google.com).
2. Create the app listing if it doesn't exist yet as a full store listing.
3. Under **Monetize → Products → In-app products**, create one product per tip tier (Google calls these
   "managed products" — consumable behavior is handled by your code calling `consumeAsync` after purchase,
   Google doesn't have a separate "consumable" product type distinct from subscriptions).
4. Generate a **Google Play service account** JSON key (Play Console → Setup → API access) for RevenueCat.

### RevenueCat setup
1. Create a RevenueCat account (app.revenuecat.com) and a new "Project" for this app.
2. Add the iOS app: link the bundle ID (`com.amrshams.bankelzikr` per the Xcode project we've been
   working with) and paste in the App Store Connect API key from above.
3. Add the Android app (if in scope): link the package name and paste in the Play service account key.
4. In RevenueCat, create an **Offering** (e.g. "default") containing **Packages** that map to each tip
   tier's Product ID from both stores.
5. Get the RevenueCat **public SDK API key** (separate per platform) — this is what goes into the Flutter
   app config, not the store API keys (those stay server-side in RevenueCat's dashboard, never shipped in
   the app).

## Architecture (per this repo's layer conventions — see root `CLAUDE.md`)

New feature folder: `lib/features/donations/` (replaces whatever currently backs the existing donate
button — needs a look at the current implementation to confirm what's being replaced).

```
lib/features/donations/
  data/
    datasources/
      revenuecat_donation_datasource.dart   # wraps purchases_flutter (RevenueCat's Flutter SDK) calls
    repositories/
      donation_repository_impl.dart
  domain/
    entities/
      tip_tier.dart                          # id, price, display name — hydrated from RevenueCat offerings
    repositories/
      donation_repository.dart
    usecases/
      get_available_tips.dart                # fetch current Offering's packages
      purchase_tip.dart                       # trigger a purchase for a chosen tier
  presentation/
    cubit/
      donation_cubit.dart                     # RequestCubit<List<TipTier>>, likely registerFactory
                                                # (screen-local, no cross-screen shared state needed)
    screens/
      donation_screen.dart / donation_route.dart   # or a bottom sheet, matching existing donate-button UX
```

- `purchases_flutter` (RevenueCat's official Flutter SDK) is the new pubspec dependency — needs adding,
  not yet present.
- Follows the existing mapper rule if any data model maps to a domain entity; `TipTier` here is likely
  populated directly from RevenueCat SDK response objects rather than a persisted Hive model, since tip
  tiers are remote-configured, not locally stored — worth confirming this doesn't need a mapper per the
  strict rule once the actual RevenueCat SDK response shape is known.
- No Hive persistence needed for this feature (no typeId consumed) — purchases are tracked by
  RevenueCat/App Store, not locally, unless you want a "thank you, you've tipped N times" local counter as
  a nice-to-have (open question).

## Open questions for you before implementation starts

1. **Tip tiers**: how many, what prices, what display names/emoji? (blocking — implementation cannot
   start without this)
2. **Consumable, repeatable tips** — confirm this is the intended purchase model (vs. a single one-time
   "supporter" unlock)?
3. **iOS only for v1, or Android too?** Determines whether Google Play Console setup is in scope now or
   deferred.
4. **What replaces the current donate button** — same location/UI trigger, or does this become a new
   dedicated screen/sheet?
5. **Post-purchase UX**: just a thank-you toast, or something persistent (e.g. a small badge/thank-you
   message shown afterward)?
6. **Do you already have an Apple Developer Program account**, or does this plan need to account for that
   enrollment as a first step?
