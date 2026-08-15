import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_pricing.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';

abstract class DonationRepository {
  Future<RequestResult<SupporterStatus>> getSupporterStatus();
  Future<RequestResult<SupporterPricing>> getSupporterPricing();
  Future<RequestResult<SupporterStatus>> subscribe(String packageIdentifier);
  Future<RequestResult<SupporterStatus>> restorePurchases();
}
