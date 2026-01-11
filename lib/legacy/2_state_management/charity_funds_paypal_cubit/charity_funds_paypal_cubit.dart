import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../1_ui/core/consts/third_party_values.dart';

part 'charity_funds_paypal_state.dart';

class CharityFundsPaypalCubit extends Cubit<CharityFundsPaypalState> {
  CharityFundsPaypalCubit() : super(CharityFundsPaypalInitial());

  launchCharityLink() async {
    emit(CharityFundsPaypalLoading());
    try {
      final Uri uri = Uri.parse(ThirdPartyValues.paypalLink);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch';
      }

      emit(CharityFundsPaypalLoaded());
    } catch (e) {
      emit(CharityFundsPaypalError());
    }
  }
}
