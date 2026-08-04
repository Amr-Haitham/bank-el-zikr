import 'dart:io';

import 'package:flutter/foundation.dart';

class ThirdPartyValues {
  static final appLink = !kIsWeb && Platform.isIOS
      ? 'https://apps.apple.com/app/id6752685604'
      : 'https://play.google.com/store/apps/details?id=com.neutron.bank_el_zikr';

  static const paypalLink = "https://www.paypal.com/paypalme/neutron01";
  static const emailLink = "amrofficialacc2@gmail.com";
}
