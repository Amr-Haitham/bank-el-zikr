import 'package:vibration/vibration.dart';

/// A single short buzz — used for smaller milestones (e.g. finishing one
/// zikr's repetitions). Calls the device's real Vibrator service directly
/// via the `vibration` package, rather than [HapticFeedback.vibrate], which
/// routes through Android's touch-feedback system setting — one several
/// OEMs (e.g. Huawei/EMUI) disable by default, silently suppressing it.
Future<void> vibrateOnce() async {
  if (!await Vibration.hasVibrator()) return;
  await Vibration.vibrate(duration: 80);
}

/// A short multi-pulse "celebration" buzz — used for bigger milestones
/// (e.g. reaching a Tasbih goal, or finishing the whole morning/evening
/// adhkar list) so they feel distinct from a single-zikr buzz.
Future<void> vibrateCelebration() async {
  if (!await Vibration.hasVibrator()) return;
  await Vibration.vibrate(pattern: [0, 80, 160, 80, 160, 80]);
}
