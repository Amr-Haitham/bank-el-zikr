import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ZikrCategory extends Equatable {
  final String key;
  final String title;
  final String titleEn;
  final IconData icon;
  final Color color;
  final bool isTrackedDaily;

  const ZikrCategory({
    required this.key,
    required this.title,
    required this.titleEn,
    required this.icon,
    required this.color,
    required this.isTrackedDaily,
  });

  String displayTitle(bool isEnglish) => isEnglish ? titleEn : title;

  @override
  List<Object?> get props => [key, title, titleEn, icon, color, isTrackedDaily];
}
