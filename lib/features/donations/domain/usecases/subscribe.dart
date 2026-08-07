import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';
import 'package:bank_el_ziker/features/donations/domain/repositories/donation_repository.dart';

class Subscribe implements UseCase<SupporterStatus, NoParams> {
  final DonationRepository repository;

  Subscribe(this.repository);

  @override
  Future<RequestResult<SupporterStatus>> call(NoParams params) async {
    return await repository.subscribe();
  }
}
