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
  Future<List<Package>> getSupporterPackages();
  Future<bool> subscribe(String packageIdentifier);
  Future<bool> restorePurchases();
}

class RevenueCatDonationDataSourceImpl implements RevenueCatDonationDataSource {
  bool _isSupporterEntitlementActive(CustomerInfo customerInfo) {
    return customerInfo.entitlements.active
        .containsKey(ThirdPartyValues.supporterEntitlementId);
  }

  Future<Offering?> _getSupporterOffering() async {
    final offerings = await Purchases.getOfferings();
    return offerings.getOffering(
          ThirdPartyValues.monthlySupporterOfferingId,
        ) ??
        offerings.current;
  }

  @override
  Future<bool> isSupporterActive() async {
    if (!await Purchases.isConfigured) return false;

    final customerInfo = await Purchases.getCustomerInfo();
    return _isSupporterEntitlementActive(customerInfo);
  }

  @override
  Future<List<Package>> getSupporterPackages() async {
    if (!await Purchases.isConfigured) return [];

    final offering = await _getSupporterOffering();
    return offering?.availablePackages ?? [];
  }

  @override
  Future<bool> subscribe(String packageIdentifier) async {
    if (!await Purchases.isConfigured) {
      throw const DonationsNotConfiguredException();
    }

    final offering = await _getSupporterOffering();
    final package = offering?.availablePackages.firstWhere(
      (package) => package.identifier == packageIdentifier,
      orElse: () => throw Exception(
        'No supporter subscription package is available.',
      ),
    );
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
