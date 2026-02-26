import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class FailureBase implements Exception {
  final Object? exception;
  final String? message;

  const FailureBase({this.exception, this.message});

  /// Returns a nice message that can be displayed to the user.
  /// [BuildContext] is provided for localization purposes.
  String getDisplayMessage(BuildContext context);

  /// Returns the full exception details when in debug mode.
  /// Otherwise, it returns the display message as defined by [getDisplayMessage].
  /// [BuildContext] is provided for localization purposes.
  String getRunModeDependentMessage(BuildContext context) {
    final debugMessage = '''
      $message
      ${exception.toString()}
    ''';

    return kDebugMode ? debugMessage : getDisplayMessage(context);
  }
}

class Failure extends FailureBase {
  const Failure({super.exception, super.message});

  @override
  String getDisplayMessage(BuildContext context) {
    return message ?? 'An error occurred';
  }
}

class UserNotSignedInFailure extends Failure {
  const UserNotSignedInFailure({super.exception, super.message});

  @override
  String getDisplayMessage(BuildContext context) {
    return 'User is not signed in';
  }
}
