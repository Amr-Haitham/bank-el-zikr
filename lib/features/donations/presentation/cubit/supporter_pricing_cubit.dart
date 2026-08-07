import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_pricing.dart';
import 'package:bank_el_ziker/features/donations/domain/usecases/get_supporter_pricing.dart';

class SupporterPricingCubit extends RequestCubit<SupporterPricing> {
  SupporterPricingCubit({required GetSupporterPricing getSupporterPricing})
      : super(request: () => getSupporterPricing(const NoParams()));
}
