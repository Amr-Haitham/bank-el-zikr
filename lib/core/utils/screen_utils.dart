import 'package:flutter/cupertino.dart';

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