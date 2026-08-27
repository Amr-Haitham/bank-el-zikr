import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      _NavItemData(icon: Icons.grid_view_rounded, label: l10n.navHome),
      _NavItemData(icon: Icons.track_changes_outlined, label: l10n.navTasbih),
      _NavItemData(icon: Icons.menu_book_outlined, label: l10n.navAdhkar),
      _NavItemData(icon: Icons.insights_outlined, label: l10n.navJourney),
      _NavItemData(icon: Icons.settings_outlined, label: l10n.settings),
    ];

    final isLight = GeneralUtils.isLightTheme(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.bottomNavigationBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            color:
                (isLight ? Colors.black : Colors.white).withValues(alpha: 0.06),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              final isActive = tabsRouter.activeIndex == index;
              final color = isActive
                  ? context.theme.primaryColor
                  : (isLight ? Colors.grey : Colors.grey.shade600);
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => tabsRouter.setActiveIndex(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(items[index].icon, color: color, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      items[index].label,
                      style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? color : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  const _NavItemData({required this.icon, required this.label});
}
