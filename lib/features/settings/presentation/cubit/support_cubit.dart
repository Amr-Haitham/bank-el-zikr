import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/layers/presentation/request_cubit/request_cubit.dart';
import '../../../../core/constants/third_party_values.dart';

class SupportCubit extends Cubit<RequestState<void>> {
  SupportCubit() : super(RequestState.initial());

  Future<void> launchEmail() async {
    emit(RequestState.loading());
    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: ThirdPartyValues.emailLink,
        query: 'subject=استفسار مستخدم بنك الذكر&body=أريد السؤال عن...',
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
        emit(RequestState.success(null));
      } else {
        emit(RequestState.failure(const Failure(message: 'Could not launch email')));
      }
    } catch (e) {
      emit(RequestState.failure(Failure(message: e.toString())));
    }
  }

  Future<void> launchCharityLink() async {
    emit(RequestState.loading());
    try {
      final Uri uri = Uri.parse(ThirdPartyValues.paypalLink);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        emit(RequestState.success(null));
      } else {
        emit(RequestState.failure(
            const Failure(message: 'Could not launch charity link')));
      }
    } catch (e) {
      emit(RequestState.failure(Failure(message: e.toString())));
    }
  }
}
