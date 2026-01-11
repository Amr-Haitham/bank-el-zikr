// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountBalanceRoute]
class AccountBalanceRoute extends PageRouteInfo<void> {
  const AccountBalanceRoute({List<PageRouteInfo>? children})
      : super(
          AccountBalanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountBalanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountBalanceRoute();
    },
  );
}

/// generated route for
/// [AzkarRoute]
class AzkarRoute extends PageRouteInfo<void> {
  const AzkarRoute({List<PageRouteInfo>? children})
      : super(
          AzkarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AzkarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AzkarRoute();
    },
  );
}

/// generated route for
/// [DailyAzkarRoute]
class DailyAzkarRoute extends PageRouteInfo<void> {
  const DailyAzkarRoute({List<PageRouteInfo>? children})
      : super(
          DailyAzkarRoute.name,
          initialChildren: children,
        );

  static const String name = 'DailyAzkarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DailyAzkarRoute();
    },
  );
}

/// generated route for
/// [HomeRoute]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeRoute();
    },
  );
}

/// generated route for
/// [MorningAzkarRoute]
class MorningAzkarRoute extends PageRouteInfo<void> {
  const MorningAzkarRoute({List<PageRouteInfo>? children})
      : super(
          MorningAzkarRoute.name,
          initialChildren: children,
        );

  static const String name = 'MorningAzkarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MorningAzkarRoute();
    },
  );
}

/// generated route for
/// [NightAzkarRoute]
class NightAzkarRoute extends PageRouteInfo<void> {
  const NightAzkarRoute({List<PageRouteInfo>? children})
      : super(
          NightAzkarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NightAzkarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NightAzkarRoute();
    },
  );
}

/// generated route for
/// [SettingsRoute]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsRoute();
    },
  );
}

/// generated route for
/// [SituationsAzkarRoute]
class SituationsAzkarRoute extends PageRouteInfo<void> {
  const SituationsAzkarRoute({List<PageRouteInfo>? children})
      : super(
          SituationsAzkarRoute.name,
          initialChildren: children,
        );

  static const String name = 'SituationsAzkarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SituationsAzkarRoute();
    },
  );
}

/// generated route for
/// [TasbeehWerdRoute]
class TasbeehWerdRoute extends PageRouteInfo<void> {
  const TasbeehWerdRoute({List<PageRouteInfo>? children})
      : super(
          TasbeehWerdRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasbeehWerdRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TasbeehWerdRoute();
    },
  );
}

/// generated route for
/// [ZikrContentRoute]
class ZikrContentRoute extends PageRouteInfo<ZikrContentRouteArgs> {
  ZikrContentRoute({
    Key? key,
    required Zikr zikr,
    List<PageRouteInfo>? children,
  }) : super(
          ZikrContentRoute.name,
          args: ZikrContentRouteArgs(
            key: key,
            zikr: zikr,
          ),
          initialChildren: children,
        );

  static const String name = 'ZikrContentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ZikrContentRouteArgs>();
      return ZikrContentRoute(
        key: args.key,
        zikr: args.zikr,
      );
    },
  );
}

class ZikrContentRouteArgs {
  const ZikrContentRouteArgs({
    this.key,
    required this.zikr,
  });

  final Key? key;

  final Zikr zikr;

  @override
  String toString() {
    return 'ZikrContentRouteArgs{key: $key, zikr: $zikr}';
  }
}
