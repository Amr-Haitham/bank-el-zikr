import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Formats [value] as Arabic-Indic digits (١٢٣) or Western digits (123)
/// depending on the user's "Numerals" setting.
///
/// Reads [SettingsCubit] reactively (via [context.watch]), so widgets using
/// this rebuild automatically when the setting changes.
String formatNumber(BuildContext context, Object value) {
  final useArabicNumerals = context
          .watch<SettingsCubit>()
          .state
          .whenOrNull(success: (Settings s) => s.useArabicNumerals) ??
      true;

  return useArabicNumerals ? ArabicNumbers().convert(value) : value.toString();
}
