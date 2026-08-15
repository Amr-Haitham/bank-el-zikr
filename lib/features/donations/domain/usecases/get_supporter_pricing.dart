import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_pricing.dart';
import 'package:bank_el_ziker/features/donations/domain/repositories/donation_repository.dart';

class GetSupporterPricing implements UseCase<SupporterPricing, NoParams> {
  final DonationRepository repository;

  GetSupporterPricing(this.repository);

  @override
  Future<RequestResult<SupporterPricing>> call(NoParams params) async {
    return await repository.getSupporterPricing();
  }
}
