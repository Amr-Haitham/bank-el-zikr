import 'package:flutter/services.dart';

/// A single short buzz — used for smaller milestones (e.g. finishing one
/// zikr's repetitions). Uses [HapticFeedback.vibrate], which reliably
/// triggers real hardware vibration across Android devices (unlike
/// mediumImpact/heavyImpact, which map to Android's UI touch-feedback
/// constants and are frequently suppressed by OEM settings).
void vibrateOnce() {
  HapticFeedback.vibrate();
}

/// A short multi-pulse "celebration" buzz — used for bigger milestones
/// (e.g. reaching a Tasbih goal, or finishing the whole morning/evening
/// adhkar list) so they feel distinct from a single-zikr buzz.
Future<void> vibrateCelebration() async {
  HapticFeedback.vibrate();
  await Future.delayed(const Duration(milliseconds: 160));
  HapticFeedback.vibrate();
  await Future.delayed(const Duration(milliseconds: 160));
  HapticFeedback.vibrate();
}
