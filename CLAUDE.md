# Bank El Zikr

Flutter app (package `bank_el_ziker`) built with Clean Architecture + BLoC/Cubit. This file is the
authoritative architecture reference for agents working in this repo — follow it exactly.

## Layer structure

Every feature under `lib/features/<feature_name>/` follows the same three-layer split:

```
lib/features/<feature_name>/
  data/
    datasources/     # Hive/local or remote I/O, raw reads/writes
    models/          # (optional) serialization models
    repositories/     # implements the domain repository interface
  domain/
    entities/         # plain Dart classes, pure business logic lives here
    repositories/     # abstract repository interfaces
    usecases/         # one class per operation, calls into a repository
  presentation/
    cubit/            # state management, orchestrates use cases
    screens/           # route (`*_route.dart`) + screen (`*_screen.dart`)
    screens/components/  # (optional) screen-local widget breakdown
```

**Rule**: business logic (calculations, derived stats, streaks, aggregation) belongs in `domain/entities`
or `domain/usecases`, not in cubits or widgets. Cubits orchestrate; they don't compute. See
`lib/features/azkar_records/domain/entities/journey_stats.dart` for the reference example — it's a pure
class over a list of entities with no Flutter/Bloc dependency, computing streaks and growth stats.

**Rule** (changed 2026-08-02 — supersedes any earlier note that mapping lives on the data model itself):
mapping is a dedicated mapper's job, not the data model's and not the domain entity's. Every persisted
data model that has a matching `domain/entities` class gets a sibling `<model>_mapper.dart` in the same
`data/models/` directory, holding a single class `<Model>Mapper` with **static** methods covering every
direction of conversion:

```dart
class ZikrMapper {
  static ZikrEntity toEntity(Zikr model) { ... }
  static Zikr toModel(ZikrEntity entity) { ... }
  static Zikr fromParams(AddCustomZikrParams params) { ... }
}
```

- `toEntity(model)` — data model → domain entity.
- `toModel(entity)` — domain entity → data model.
- `fromParams(params)` — a use-case's `Params` input → data model, when a use case constructs/persists a
  model directly from caller-supplied fields rather than from an existing entity. Not every model needs
  this direction; add it only when a real `Params` class feeds that model.
- The data model itself (`Zikr`, `GeneralData`, `DayRecord`, etc.) holds only its fields and Hive
  annotations — no `toEntity()`/`fromEntity()` methods on the model, no conversion logic of any kind.
- Domain entities must stay free of any mapping/serialization code, Hive/JSON annotations, or knowledge
  that a data model exists — they hold state and business logic only.
- One mapper class per model, not one per feature and not one shared catch-all mapper — keep the 1:1
  file-to-model relationship so a mapper is always easy to find next to the model it serves.

## State management: `RequestCubit<T>` is the standard

`lib/core/layers/presentation/request_cubit/request_cubit.dart` defines `RequestCubit<T>`, a base class
wrapping `RequestState<T>` (`initial` / `loading` / `success(T)` / `failure(FailureBase)`, a `freezed`
union). This is the pattern used by the large majority of cubits in this codebase (24 of 25 cubit classes
on `main`) and is the default for any new cubit that executes a request (fetch, save, compute-and-persist)
and needs to report loading/error state to its screen.

```dart
class GetSettingsCubit extends RequestCubit<Settings> {
  GetSettingsCubit({required GetSettings getSettings})
      : super(request: () => getSettings(const NoParams()));
}
```

- If the cubit needs parameters per-call (not just on creation), don't pass `request` to the constructor —
  add a method that calls `execute(() => useCase(params))` internally instead.
- **Do not** extend plain `Cubit<T>` for request-shaped work just because the state is a list/map instead
  of a single object — wrap it in `RequestState<List<T>>` etc. so failures surface instead of being
  silently swallowed. Fixed 2026-08-02: the two cubits that used to deviate from this
  (`DailyActivityLogCubit`, `AdhkarProgressCubit`) were replaced by `DayRecordCubit` and
  `ReadingProgressCubit` respectively, both proper `RequestCubit<T>` subclasses — see Local persistence
  below for what replaced the models behind them.

## Use cases

One class per operation, implementing `UseCase<Result, Params>` from
`lib/core/layers/domain/usecases/usecase.dart`:

```dart
abstract class UseCase<Result, Params> {
  Future<RequestResult<Result>> call(Params params);
}
class NoParams { const NoParams(); }
```

`RequestResult<T>` is `typedef RequestResult<T> = Either<FailureBase, T>` (dartz), defined in
`lib/core/constants/type_definitions.dart`. Repository implementations wrap I/O in `safeAwait` (from
`lib/core/utils/safe_await.dart`) to convert thrown exceptions into `Left(FailureBase)` automatically —
use it rather than hand-rolled try/catch in repository impls.

## Dependency injection

`lib/core/di/service_locator.dart` registers everything with GetIt, accessed via `getService<T>()`.

- **`registerLazySingleton`**: use for any cubit that must share state across multiple screens (e.g. a
  cubit read on one screen and written on another). This project has hit real bugs from getting this
  wrong — `SettingsCubit` and `CounterCubit` were both originally registered as factories, so the app-root
  instance (in `main.dart`) and the screen-local instance diverged, and toggles silently didn't apply
  until a full restart. If a cubit's state needs to be consistent between the app root and any screen, or
  between two sibling screens, it must be a singleton.
- **`registerFactory`**: use for cubits that are genuinely screen-local/one-shot and never need to be read
  elsewhere.

## Routing and providers

`auto_route` drives navigation (`lib/core/router/app_router.dart`, generated `app_router.gr.dart`). Each
route file (`<feature>_route.dart`) is a `@RoutePage()` widget whose only job is to wrap the screen in a
`MultiBlocProvider` pulling cubits from the service locator:

```dart
@RoutePage()
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<GetAllAzkarCubit>()),
        BlocProvider(create: (context) => getService<AddCustomZikrCubit>()),
        // ...
      ],
      child: const AzkarScreen(),
    );
  }
}
```

Screens (`*_screen.dart`) contain the actual UI and `BlocBuilder`/`context.read()` calls. Don't put
`MultiBlocProvider` inside the screen widget — that's the route file's job.

## Theme and colors

- `lib/core/constants/colors.dart` holds named top-level `Color` constants (e.g. `appGray`,
  `appDarkGreen`, `appInactiveSwitch`).
- `lib/core/theme/app_theme.dart` defines `AppTheme.lightTheme` / `AppTheme.darkTheme` (`ThemeData`). This
  is the only file allowed to reference `colors.dart` constants directly.
- `lib/core/extensions/context.dart` (`ContextExtension on BuildContext`) exposes theme shortcuts —
  `context.theme` (= `Theme.of(context)`), `context.textTheme` (= `Theme.of(context).textTheme`),
  `context.colors` (= `Theme.of(context).colorScheme`). **Widgets must use these, not `Theme.of(context)`
  spelled out, and never `colors.dart` constants or raw `Color(0xff...)` literals directly.** Example:
  `context.textTheme.bodySmall`, `context.colors.primary`.
- **Required pipeline**: named constant in `colors.dart` → consumed only inside `app_theme.dart` to build
  `ThemeData` → widgets read it back out via the `context.theme` / `context.textTheme` / `context.colors`
  extension getters above. This is not yet fully true of the existing code (`app_theme.dart` still has
  inline hex literals like `Color(0xff34C759)` instead of named constants) — when you touch
  `app_theme.dart` or add a new color, move it onto this pipeline; don't add another inline hex literal.
- Sizes/paddings go into `lib/core/constants/constant_values.dart` (`ConstantValues`), not inline literals.

## Shared widgets and utils

**Rule**: break screens down into reusable components, but scope them correctly.
- A widget used only within one feature's screens goes in that feature's own
  `presentation/widgets/` or `presentation/screens/components/` (both directory names are in active use
  — e.g. `features/home/presentation/widgets/`, `features/azkar_records/presentation/screens/components/`
  — pick whichever already exists in that feature, or `widgets/` if starting fresh).
- A widget that's genuinely reused **across more than one feature** belongs in
  `lib/core/layers/presentation/widgets/`, not duplicated per-feature and not left in one feature's folder
  and imported cross-feature. Verified as of 2026-07-19: no feature-local widget is currently imported
  from outside its own feature — keep it that way. If you find yourself importing a widget from another
  feature's `presentation/widgets/`, that's the signal to promote it to `core/layers/presentation/widgets/`
  instead, not to just import it in place.

`lib/core/layers/presentation/widgets/` currently has: `TitleWithBackButton` (used on 8 screens),
`CustomAppTextField`, `CustomAppButton`, `ZikrRepetitionCountCircle`, `popup_functions.dart` (dialog
helpers). Check here before building a new one from scratch. **`zikr_card.dart` is unused (0
references) — don't treat it as a live shared widget.**

`lib/core/utils/general_utils.dart` (`GeneralUtils.isLightTheme(context)`) and
`lib/core/utils/screen_utils.dart` (`ScreenUtils.getScreenWidth/Height(context)`) are small static
helpers still used in a few places. `GeneralUtils.isLightTheme` duplicates what `context.theme.brightness
== Brightness.light` now gives you via the extension above — prefer the extension in new code; the
static helper is legacy, not a second sanctioned pattern.

## Local persistence (Hive)

`lib/core/layers/data/services/hive_db.dart` (`HiveDB`) owns all Hive setup: registers every
`@HiveType`-annotated model's adapter in `initHiveDB()`, and seeds/migrates box contents in
`setupInitHiveDbDataIfNonExisting()` (also handles wiping stale boxes on app version bump, keyed off
`ReleaseVersion.version` in `lib/core/constants/version.dart`). Both are called once from `main()` before
`setupServiceLocator()`.

Data-layer models that persist via Hive live in each feature's `data/models/` (e.g.
`lib/features/settings/data/models/version_model.dart`) and follow:
```dart
part 'version_model.g.dart';

@HiveType(typeId: 5)
class Version {
  @HiveField(0)
  final int currentVersion;
  Version({required this.currentVersion});
}
```
Conversion to/from `Version`'s matching domain entity (if any) lives in a sibling `version_mapper.dart`
per the mapping rule above — not on `Version` itself.

Run `dart run build_runner build` after adding/changing a `@HiveType`/`@HiveField` model to regenerate the
`.g.dart` adapter. **Every `typeId` must be unique across the whole app** (Hive has no per-box namespacing)
— check `hive_db.dart`'s registered adapters and existing models before picking a new one. Registered as
of 2026-08-02: `Zikr` (0), `GeneralData` (2), `DayRecord` (6), `ReadingProgress` (7), `Prayer` (4),
`Version` (5), plus `LegacyDayZikrRecord` (1, migration-only — see below).

**`Zikr` and `ZikrCategory` intentionally live in `lib/core/`** (`core/data/models/zikr_model.dart`,
`core/domain/entities/zikr.dart`, `core/domain/entities/zikr_category.dart`), a deliberate exception to
data-models-live-in-their-feature: both are genuinely shared across `adhkar`, `zikr_counter`, and
`azkar_records`, not owned by any single one. `ZikrCategory` is plain seeded data (title/icon/color per
category, inline bilingual fields matching `Zikr`'s own pattern — not routed through the ARB/l10n system,
which is still scaffolding elsewhere in the app), defined as a static list in
`lib/core/constants/initial_data.dart`, not Hive-persisted and not hardcoded into any screen.

**Every `Zikr` has a permanent `zikrKey: String`**, assigned once in `initial_data.dart` (e.g.
`'morning_014'`, or `'custom_<id>'` for user-added zikr via `generateCustomZikrKey()` in
`core/constants/general_functions.dart`) and never reused or reassigned. All cross-feature references to
a specific zikr (`GeneralData.currentZikrKey`, `DayRecord.repsByZikrKey`, `ReadingProgress.repsByZikrKey`)
use this key, not `Zikr.id` (an `int`, Hive-internal only, not a stable identifier — the content box is
still fully cleared and reseeded on every version bump, so `id` value/ordering is not preserved across
releases).

**`DayRecord`** (`azkar_records`, typeId 6) is the single unbounded per-day history record — one row per
calendar date, feeding streaks, the growth chart, and the weekly grid via
`lib/features/azkar_records/domain/entities/journey_stats.dart`. Tracks `repsByZikrKey` plus
`morningCompleted`/`eveningCompleted`/`sleepCompleted` (the three daily-tracked categories). Replaced two
formerly-parallel, duplicate-writing structures: `DayZikrRecord` (a Hive box pruned to a 7-day rolling
window) and `daily_activity_log` (hand-rolled JSON in SharedPreferences, unbounded). If you're migrating
old data, `lib/core/layers/data/services/legacy_day_zikr_record_model.dart` (typeId 1) is a read-only
shape of the old `DayZikrRecord` kept solely so `HiveDB` can fold existing users' history into the new
box on the version-11 upgrade — don't build on it, it's not a live pattern.

**`ReadingProgress`** (`azkar_records`, typeId 7) is per-category (not per-day) resume state for the
adhkar reading screen — which zikr was last tapped in a category's list, and when. Resets automatically
when the stored row's `date` isn't today (see `ReadingProgressLocalDataSourceImpl._isToday`), so a
half-finished session never resumes into a new calendar day. Replaced `adhkar_progress`, formerly
hand-rolled JSON in SharedPreferences with no Hive model at all.

## Known inconsistencies (don't copy these; don't assume they're fixed)

- **`lib/core/errors/failures.dart`** defines a second, unused `Failure`/`CacheFailure`/`ServerFailure`/
  `NetworkFailure` hierarchy (Equatable-based). It has zero imports anywhere in the app — the real one in
  use is `FailureBase` in `lib/core/layers/data/failure/failure.dart` (see Use cases section above). Don't
  import from `core/errors/failures.dart`; if you're touching this area, it's dead code eligible for
  deletion, not a second valid pattern.
- **`arabic_numbers` is still a live dependency**, imported in ~9 files (e.g.
  `ArabicNumbers().convert(currentCounter)` in `zikr_counter/presentation/widgets/counter_circle.dart`) to
  render counter digits in Arabic-Indic numerals. A prior note in this repo's history claimed this package
  was fully removed in favor of `.toString()` — that was not true as of 2026-07-19; verify current usage
  with `grep -rl arabic_numbers lib` before relying on either claim.
- **`lib/core/layers/` contains several unimplemented/unused abstractions alongside the real patterns** —
  verify a class in `core/layers/` is actually referenced elsewhere before treating it as the sanctioned
  pattern. Confirmed dead as of 2026-07-19 (zero references outside their own file):
  `BaseServiceRepositoryInterface` and `BaseStorageServiceRepositoryInterface`
  (`core/layers/domain/repositories/`, look like scaffolding for a remote backend — `uri`/`docId`/bucket
  upload shape — that this app never built; all real persistence is local via Hive/SharedPreferences),
  `ManageListUseCase`/`ManageListUseCaseFactory` (`core/layers/domain/usecases/manage_list_use_case.dart`),
  and `CacheClient` (`core/layers/data/cache/cache_client.dart`, a Hive wrapper with TTL support). Also
  `lib/core/layers/data/services/hijri_date_api.dart` is entirely commented out — Hijri dates are actually
  computed locally via the `jhijri` package, not fetched from an API.
- **`FailureBase.getDisplayMessage()` / `getRunModeDependentMessage()` are never called anywhere in the
  app.** Screens only ever handle the `success` branch of `RequestState` via `state.whenOrNull(success:
  ...)` (see `settings_screen.dart`); `loading` and `failure` states are structurally emitted by
  `RequestCubit` but nothing in the UI reacts to them — a failed request currently just leaves the last
  known UI state on screen with no error surfaced to the user. If you're adding a screen that should show
  errors, don't assume this is already handled elsewhere — wire the `failure` branch explicitly (e.g. via
  `context.showErrorNotification` from `lib/core/extensions/context.dart` — it exists but nothing calls it
  yet; the two existing snackbar usages in the app both bypass it and call
  `ScaffoldMessenger.of(context).showSnackBar(...)` directly instead). Prefer the extension for new code.

## Localization

`lib/l10n/` holds `app_ar.arb` (template/source, since Arabic is the primary locale) and `app_en.arb`,
generating `AppLocalizations` via `flutter gen-l10n` (config in `l10n.yaml`, `generate: true` in
`pubspec.yaml`). Locale is stored on `Settings` (`SettingsCubit`, a singleton) and read in `main.dart` to
drive `MaterialApp.router`'s `locale`. This is a scaffold, not a full migration — most existing
feature/widget strings are still hardcoded Arabic. When adding new user-facing text to a screen already
migrated (e.g. Home), add the string to both ARB files and use `AppLocalizations.of(context)!.key`. Don't
block unrelated work on migrating an entire screen's strings unless that's the actual task.

## Comments

Do not write comments in code in this repo — no doc comments (`///`), no inline explanations, no
file-header blocks. This overrides the general default of adding a comment when something is
non-obvious; here, prefer clear naming/structure over a comment, even for genuinely non-obvious logic.
When editing a file that already has comments, leave existing ones alone unless the edit specifically
asks for cleanup — don't strip them incidentally as a side effect of an unrelated change.

## Testing / verification

Before considering a change done:
- `flutter analyze` should introduce no new issues (one pre-existing `library_private_types_in_public_api`
  info-level lint on `settings_screen.dart` is known and not worth fixing incidentally).
- For UI changes, actually run the app (`flutter run -d chrome` is the fastest loop) and exercise the
  screen — don't rely on analyze/tests alone to confirm a UI change works.
