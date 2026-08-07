import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseCancelledException implements Exception {
  const PurchaseCancelledException();
}

class DonationsNotConfiguredException implements Exception {
  const DonationsNotConfiguredException();
}

abstract class RevenueCatDonationDataSource {
  Future<bool> isSupporterActive();
  Future<String?> getSupporterPackagePriceString();
  Future<bool> subscribe();
  Future<bool> restorePurchases();
}

class RevenueCatDonationDataSourceImpl implements RevenueCatDonationDataSource {
  bool _isSupporterEntitlementActive(CustomerInfo customerInfo) {
    return customerInfo
        .entitlements.active
        .containsKey(ThirdPartyValues.supporterEntitlementId);
  }

  Future<Package?> _getSupporterPackage() async {
    final offerings = await Purchases.getOfferings();
    final offering = offerings.getOffering(
          ThirdPartyValues.monthlySupporterOfferingId,
        ) ??
        offerings.current;

    if (offering == null || offering.availablePackages.isEmpty) return null;
    return offering.availablePackages.first;
  }

  @override
  Future<bool> isSupporterActive() async {
    if (!await Purchases.isConfigured) return false;

    final customerInfo = await Purchases.getCustomerInfo();
    return _isSupporterEntitlementActive(customerInfo);
  }

  @override
  Future<String?> getSupporterPackagePriceString() async {
    if (!await Purchases.isConfigured) return null;

    final package = await _getSupporterPackage();
    return package?.storeProduct.priceString;
  }

  @override
  Future<bool> subscribe() async {
    if (!await Purchases.isConfigured) {
      throw const DonationsNotConfiguredException();
    }

    final package = await _getSupporterPackage();
    if (package == null) {
      throw Exception('No supporter subscription package is available.');
    }

    try {
      final customerInfo = await Purchases.purchasePackage(package);
      return _isSupporterEntitlementActive(customerInfo);
    } on PlatformException catch (e) {
      if (PurchasesErrorHelper.getErrorCode(e) ==
          PurchasesErrorCode.purchaseCancelledError) {
        throw const PurchaseCancelledException();
      }
      rethrow;
    }
  }

  @override
  Future<bool> restorePurchases() async {
    if (!await Purchases.isConfigured) {
      throw const DonationsNotConfiguredException();
    }

    final customerInfo = await Purchases.restorePurchases();
    return _isSupporterEntitlementActive(customerInfo);
  }
}
