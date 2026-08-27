import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

class GeneralUtils {
  static isLightTheme(BuildContext context) =>
      context.theme.brightness == Brightness.light;
}
