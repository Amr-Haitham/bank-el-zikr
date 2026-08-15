import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/features/donations/data/datasources/revenuecat_donation_datasource.dart';
import 'package:bank_el_ziker/features/donations/data/models/supporter_package_mapper.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_pricing.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';
import 'package:bank_el_ziker/features/donations/domain/repositories/donation_repository.dart';

class DonationRepositoryImpl implements DonationRepository {
  final RevenueCatDonationDataSource dataSource;

  DonationRepositoryImpl({required this.dataSource});

  @override
  Future<RequestResult<SupporterStatus>> getSupporterStatus() {
    return safeAwait(() async {
      final isActive = await dataSource.isSupporterActive();
      return SupporterStatus(isActive: isActive);
    });
  }

  @override
  Future<RequestResult<SupporterPricing>> getSupporterPricing() {
    return safeAwait(() async {
      final packages = await dataSource.getSupporterPackages();
      return SupporterPricing(
        packages: packages.map(SupporterPackageMapper.toEntity).toList(),
      );
    });
  }

  @override
  Future<RequestResult<SupporterStatus>> subscribe(String packageIdentifier) {
    return safeAwait(() async {
      try {
        final isActive = await dataSource.subscribe(packageIdentifier);
        return SupporterStatus(isActive: isActive);
      } on PurchaseCancelledException {
        return const SupporterStatus(isActive: false);
      }
    });
  }

  @override
  Future<RequestResult<SupporterStatus>> restorePurchases() {
    return safeAwait(() async {
      final isActive = await dataSource.restorePurchases();
      return SupporterStatus(isActive: isActive);
    });
  }
}
