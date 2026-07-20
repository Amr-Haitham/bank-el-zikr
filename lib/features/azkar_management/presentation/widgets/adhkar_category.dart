import 'package:flutter/material.dart';

class AdhkarCategory {
  const AdhkarCategory({
    required this.title,
    required this.progressKey,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  final String title;

  /// Key into the real progress map (from AdhkarProgressCubit), or null
  /// when this category isn't tracked yet (no dedicated data/screen exists).
  final String? progressKey;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback onTap;
}
