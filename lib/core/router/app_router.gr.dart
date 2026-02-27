// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountBalancePage]
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
      return const AccountBalancePage();
    },
  );
}

/// generated route for
/// [AzkarListPage]
class AzkarListRoute extends PageRouteInfo<void> {
  const AzkarListRoute({List<PageRouteInfo>? children})
      : super(
          AzkarListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AzkarListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AzkarListPage();
    },
  );
}

/// generated route for
/// [AzkarPage]
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
      return const AzkarPage();
    },
  );
}

/// generated route for
/// [DailyAzkarPage]
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
      return const DailyAzkarPage();
    },
  );
}

/// generated route for
/// [HomePage]
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
      return const HomePage();
    },
  );
}

/// generated route for
/// [MainShellPage]
class MainShellRoute extends PageRouteInfo<void> {
  const MainShellRoute({List<PageRouteInfo>? children})
      : super(
          MainShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainShellPage();
    },
  );
}

/// generated route for
/// [MorningAzkarPage]
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
      return const MorningAzkarPage();
    },
  );
}

/// generated route for
/// [NightAzkarPage]
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
      return const NightAzkarPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
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
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SituationsAzkarPage]
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
      return const SituationsAzkarPage();
    },
  );
}

/// generated route for
/// [TasbeehWerdPage]
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
      return const TasbeehWerdPage();
    },
  );
}

/// generated route for
/// [ZikrContentPage]
class ZikrContentRoute extends PageRouteInfo<ZikrContentRouteArgs> {
  ZikrContentRoute({
    Key? key,
    required ZikrEntity zikr,
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
      return ZikrContentPage(
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

  final ZikrEntity zikr;

  @override
  String toString() {
    return 'ZikrContentRouteArgs{key: $key, zikr: $zikr}';
  }
}
