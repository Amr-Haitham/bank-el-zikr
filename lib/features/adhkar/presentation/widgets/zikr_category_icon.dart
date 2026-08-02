import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:flutter/material.dart';

const _categoryIcons = {
  'morning': Icons.wb_sunny_outlined,
  'evening': Icons.nightlight_round,
  'sleep': Icons.bedtime_outlined,
  'wakingUp': Icons.alarm_outlined,
  'newClothes': Icons.checkroom_outlined,
  'leavingHome': Icons.logout_outlined,
  'enteringBathroom': Icons.wc_outlined,
  'leavingBathroom': Icons.wc_outlined,
  'enteringMosque': Icons.mosque_outlined,
  'leavingMosque': Icons.exit_to_app_outlined,
  'hearingAdhan': Icons.volume_up_outlined,
  'afterAdhan': Icons.campaign_outlined,
  'distress': Icons.sos_outlined,
  'sadness': Icons.sentiment_dissatisfied_outlined,
  'fearOfPeople': Icons.visibility_off_outlined,
  'meetingEnemy': Icons.gpp_maybe_outlined,
  'overwhelmed': Icons.bolt_outlined,
  'afterSin': Icons.undo_outlined,
  'unpaidDebt': Icons.payments_outlined,
  'anger': Icons.mood_bad_outlined,
  'leavingGathering': Icons.groups_outlined,
  'seeingAfflicted': Icons.healing_outlined,
  'seeingSomethingPleasing': Icons.favorite_outline,
  'leavingHomeDua': Icons.door_front_door_outlined,
  'travel': Icons.flight_outlined,
  'ridingMount': Icons.pets_outlined,
  'visitingGraves': Icons.park_outlined,
  'afterPrayer': Icons.flag_outlined,
  'ruqyah': Icons.shield_outlined,
};

const _categoryColors = {
  'morning': morningOrange,
  'evening': eveningPurple,
  'sleep': categorySleepBlue,
  'wakingUp': categoryAlarmAmber,
  'newClothes': categoryClothesTeal,
  'leavingHome': categoryDoorBrown,
  'enteringBathroom': categoryBathroomCyan,
  'leavingBathroom': categoryBathroomCyan,
  'enteringMosque': categoryMosqueGreen,
  'leavingMosque': categoryMosqueGreen,
  'hearingAdhan': categoryAdhanIndigo,
  'afterAdhan': categoryAdhanIndigo,
  'distress': categoryDistressRed,
  'sadness': categorySadnessSlate,
  'fearOfPeople': categoryFearViolet,
  'meetingEnemy': categoryEnemyMaroon,
  'overwhelmed': categoryOverwhelmedYellow,
  'afterSin': categorySinGray,
  'unpaidDebt': categoryDebtOlive,
  'anger': categoryAngerCrimson,
  'leavingGathering': categoryGatheringPlum,
  'seeingAfflicted': categoryAfflictedPink,
  'seeingSomethingPleasing': categoryPleasingRose,
  'leavingHomeDua': categoryDoorBrown,
  'travel': categoryTravelSky,
  'ridingMount': categoryMountBrown,
  'visitingGraves': categoryGravesGreen,
  'afterPrayer': categoryAfterPrayerGreen,
  'ruqyah': categoryRuqyahTeal,
};

IconData zikrCategoryIcon(String category) {
  return _categoryIcons[category] ?? Icons.self_improvement_outlined;
}

Color zikrCategoryColor(String category) {
  return _categoryColors[category] ?? primaryGreen;
}
