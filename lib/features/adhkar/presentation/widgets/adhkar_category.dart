import 'package:flutter/material.dart';

class AdhkarCategory {
  const AdhkarCategory({
    required this.title,
    required this.category,
    required this.progressKey,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
  });

  final String title;

  /// The zikr category slug (matches [ZikrEntity.category]) — the route
  /// pushed by tapping this tile always loads by this key.
  final String category;

  /// Key into the real progress map (from AdhkarProgressCubit), or null
  /// when this category isn't tracked yet (no dedicated data/screen exists).
  final String? progressKey;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
}
