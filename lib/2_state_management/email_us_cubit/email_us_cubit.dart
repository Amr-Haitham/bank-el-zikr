import 'package:bank_el_ziker/1_ui/core/consts/third_party_values.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'email_us_state.dart';

class EmailUsCubit extends Cubit<EmailUsState> {
  EmailUsCubit() : super(EmailUsInitial());
  Future<void> launchEmail() async {
    emit(EmailUsLoading());

    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: ThirdPartyValues
            .emailLink, // Replace with your actual email address
        query:
            'subject=استفسار مستخدم بنك الذكر&body=أريد السؤال عن...', // Optional: Pre-fill subject and body
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $emailUri';
      }

      emit(EmailUsLoaded());
    } catch (e) {
      emit(EmailUsError());
    }
  }
}
