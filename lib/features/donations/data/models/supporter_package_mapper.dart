import 'package:bank_el_ziker/features/donations/domain/entities/supporter_package.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SupporterPackageMapper {
  static SupporterPackage toEntity(Package package) {
    return SupporterPackage(
      identifier: package.identifier,
      title: package.storeProduct.title,
      description: package.storeProduct.description,
      priceString: package.storeProduct.priceString,
    );
  }
}
