import 'package:flutter/material.dart';

class AdhkarCategory {
  const AdhkarCategory({
    required this.title,
    required this.category,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
  });

  final String title;

  /// The zikr category slug (matches [ZikrEntity.category]) — the route
  /// pushed by tapping this tile always loads by this key, and the key into
  /// the progress map from [ReadingProgressCubit].
  final String category;

  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
}
