import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';
import 'package:bank_el_ziker/features/donations/domain/usecases/get_supporter_status.dart';
import 'package:bank_el_ziker/features/donations/domain/usecases/restore_purchases.dart';
import 'package:bank_el_ziker/features/donations/domain/usecases/subscribe.dart';

class SupporterStatusCubit extends RequestCubit<SupporterStatus> {
  final GetSupporterStatus getSupporterStatus;
  final Subscribe subscribeUseCase;
  final RestorePurchases restorePurchasesUseCase;

  SupporterStatusCubit({
    required this.getSupporterStatus,
    required this.subscribeUseCase,
    required this.restorePurchasesUseCase,
  }) : super(request: () => getSupporterStatus(const NoParams()));

  Future<void> subscribe(String packageIdentifier) {
    return execute(
      request: () => subscribeUseCase(
        SubscribeParams(packageIdentifier: packageIdentifier),
      ),
    );
  }

  Future<void> restorePurchases() {
    return execute(request: () => restorePurchasesUseCase(const NoParams()));
  }
}
