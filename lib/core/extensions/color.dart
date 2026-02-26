import 'package:flutter/material.dart';

extension ColorExtension on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
