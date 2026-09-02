import 'package:bank_el_ziker/features/donations/domain/entities/supporter_package.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

// purchases_flutter (RevenueCat) has been removed as a dependency. The
// datasource now returns SupporterPackage directly, so this is a stub
// identity mapper; restore the commented-out version below (mapping from
// RevenueCat's Package) along with the purchases_flutter dependency to
// bring the real mapping back.
class SupporterPackageMapper {
  static SupporterPackage toEntity(SupporterPackage package) {
    return package;
  }
}

// class SupporterPackageMapper {
//   static SupporterPackage toEntity(Package package) {
//     return SupporterPackage(
//       identifier: package.identifier,
//       title: package.storeProduct.title,
//       description: package.storeProduct.description,
//       priceString: package.storeProduct.priceString,
//     );
//   }
// }
