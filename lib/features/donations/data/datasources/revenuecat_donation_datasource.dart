// import 'package:bank_el_ziker/core/constants/third_party_values.dart';
// import 'package:flutter/services.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_package.dart';

class PurchaseCancelledException implements Exception {
  const PurchaseCancelledException();
}

class DonationsNotConfiguredException implements Exception {
  const DonationsNotConfiguredException();
}

abstract class RevenueCatDonationDataSource {
  Future<bool> isSupporterActive();
  Future<List<SupporterPackage>> getSupporterPackages();
  Future<bool> subscribe(String packageIdentifier);
  Future<bool> restorePurchases();
}

// purchases_flutter (RevenueCat) has been removed as a dependency. This is a
// stub implementation kept in place of the real one below so the donations
// feature still compiles; restore the commented-out implementation and the
// purchases_flutter dependency in pubspec.yaml to bring it back.
class RevenueCatDonationDataSourceImpl implements RevenueCatDonationDataSource {
  @override
  Future<bool> isSupporterActive() async {
    return false;
  }

  @override
  Future<List<SupporterPackage>> getSupporterPackages() async {
    return [];
  }

  @override
  Future<bool> subscribe(String packageIdentifier) async {
    throw const DonationsNotConfiguredException();
  }

  @override
  Future<bool> restorePurchases() async {
    throw const DonationsNotConfiguredException();
  }
}

// class RevenueCatDonationDataSourceImpl implements RevenueCatDonationDataSource {
//   bool _isSupporterEntitlementActive(CustomerInfo customerInfo) {
//     return customerInfo.entitlements.active
//         .containsKey(ThirdPartyValues.supporterEntitlementId);
//   }
//
//   Future<Offering?> _getSupporterOffering() async {
//     final offerings = await Purchases.getOfferings();
//     return offerings.getOffering(
//           ThirdPartyValues.monthlySupporterOfferingId,
//         ) ??
//         offerings.current;
//   }
//
//   @override
//   Future<bool> isSupporterActive() async {
//     if (!await Purchases.isConfigured) return false;
//
//     final customerInfo = await Purchases.getCustomerInfo();
//     return _isSupporterEntitlementActive(customerInfo);
//   }
//
//   @override
//   Future<List<Package>> getSupporterPackages() async {
//     if (!await Purchases.isConfigured) return [];
//
//     final offering = await _getSupporterOffering();
//     return offering?.availablePackages ?? [];
//   }
//
//   @override
//   Future<bool> subscribe(String packageIdentifier) async {
//     if (!await Purchases.isConfigured) {
//       throw const DonationsNotConfiguredException();
//     }
//
//     final offering = await _getSupporterOffering();
//     final package = offering?.availablePackages.firstWhere(
//       (package) => package.identifier == packageIdentifier,
//       orElse: () => throw Exception(
//         'No supporter subscription package is available.',
//       ),
//     );
//     if (package == null) {
//       throw Exception('No supporter subscription package is available.');
//     }
//
//     try {
//       final customerInfo = await Purchases.purchasePackage(package);
//       return _isSupporterEntitlementActive(customerInfo);
//     } on PlatformException catch (e) {
//       if (PurchasesErrorHelper.getErrorCode(e) ==
//           PurchasesErrorCode.purchaseCancelledError) {
//         throw const PurchaseCancelledException();
//       }
//       rethrow;
//     }
//   }
//
//   @override
//   Future<bool> restorePurchases() async {
//     if (!await Purchases.isConfigured) {
//       throw const DonationsNotConfiguredException();
//     }
//
//     final customerInfo = await Purchases.restorePurchases();
//     return _isSupporterEntitlementActive(customerInfo);
//   }
// }
