import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

enum LocationFailureReason { permissionDenied, serviceDisabled, unavailable }

class LocationFailure extends FailureBase {
  final LocationFailureReason reason;

  const LocationFailure({required this.reason, super.exception, super.message});

  @override
  String getDisplayMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (reason) {
      LocationFailureReason.permissionDenied =>
        l10n.locationRequiredForReminders,
      LocationFailureReason.serviceDisabled =>
        l10n.locationServicesOffForReminders,
      LocationFailureReason.unavailable => l10n.locationUnavailableForReminders,
    };
  }
}
