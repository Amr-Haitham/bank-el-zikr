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
      if (await canLaunch(ThirdPartyValues.paypalLink)) {
        await launch(ThirdPartyValues.paypalLink);
      } else {
        throw 'Could not launch ${ThirdPartyValues.paypalLink}';
      }

      emit(CharityFundsPaypalLoaded());
    } catch (e) {
      emit(CharityFundsPaypalError());
    }
  }
}
