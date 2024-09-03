import 'dart:ui';

import 'package:flutter/material.dart';

class GeneralUtils {
  static  isLightTheme(context)=> Theme.of(context).brightness == Brightness.light;
}