import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  static const _items = [
    _NavItemData(icon: Icons.grid_view_rounded, label: "Home"),
    _NavItemData(icon: Icons.track_changes_outlined, label: "Tasbih"),
    _NavItemData(icon: Icons.menu_book_outlined, label: "Adhkar"),
    _NavItemData(icon: Icons.insights_outlined, label: "Journey"),
  ];

  @override
  Widget build(BuildContext context) {
    final isLight = GeneralUtils.isLightTheme(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
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
            children: List.generate(_items.length, (index) {
              final isActive = tabsRouter.activeIndex == index;
              final color = isActive
                  ? Theme.of(context).primaryColor
                  : (isLight ? Colors.grey : Colors.grey.shade600);
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => tabsRouter.setActiveIndex(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_items[index].icon, color: color, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      _items[index].label,
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
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
