import 'dart:io';

import 'package:flutter/foundation.dart';

class ThirdPartyValues {
  static final appLink = !kIsWeb && Platform.isIOS
      ? 'https://apps.apple.com/app/id6752685604'
      : 'https://play.google.com/store/apps/details?id=com.neutron.bank_el_zikr';

  static const emailLink = "amrofficialacc2@gmail.com";

  static const revenueCatApiKeyIOS = String.fromEnvironment(
    'REVENUECAT_API_KEY_IOS',
    defaultValue: '',
  );
  static const revenueCatApiKeyAndroid = String.fromEnvironment(
    'REVENUECAT_API_KEY_ANDROID',
    defaultValue: '',
  );
  static const supporterEntitlementId = 'supporter';
  static const monthlySupporterOfferingId = 'default';

  static String get manageSubscriptionLink => !kIsWeb && Platform.isIOS
      ? 'https://apps.apple.com/account/subscriptions'
      : 'https://play.google.com/store/account/subscriptions?package=com.neutron.bank_el_zikr';
}
