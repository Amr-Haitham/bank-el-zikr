import 'package:flutter/cupertino.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';

class ScreenUtils {
  static double getScreenWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

}