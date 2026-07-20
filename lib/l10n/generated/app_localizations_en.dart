// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navTasbih => 'Tasbih';

  @override
  String get navAdhkar => 'Adhkar';

  @override
  String get navJourney => 'Journey';

  @override
  String get homeTitle => 'Bank el Dhikr';

  @override
  String get homeSubtitle => 'Your daily fortress';

  @override
  String get totalHasanatBalance => 'Total hasanat balance';

  @override
  String depositedToday(String count) {
    return 'Deposited today +$count';
  }

  @override
  String get depositMore => 'Deposit more +';

  @override
  String get morningAdhkar => 'Morning Adhkar';

  @override
  String get eveningAdhkar => 'Evening Adhkar';

  @override
  String get incomplete => 'Incomplete';

  @override
  String get done => 'Done';

  @override
  String get streakLabel => 'Streak';

  @override
  String dayStreakCount(String count) {
    return '$count day streak';
  }

  @override
  String get streakDescription =>
      'You\'ve completed your daily adhkar without missing a day';

  @override
  String streakSince(String date) {
    return 'Since $date';
  }

  @override
  String get viewStats => 'View statistics';

  @override
  String get supportTheApp => 'Support the app';

  @override
  String get supportSubtitle => 'Help keep Bank el Dhikr free for everyone';

  @override
  String get donate => 'Donate';

  @override
  String get anotherVerse => 'Another verse';

  @override
  String get shareReward => 'Share the reward with friends';

  @override
  String get digitalTasbih => 'Digital Tasbih';

  @override
  String get errorLoadingCounter => 'Error loading counter';

  @override
  String get resetLabel => 'Reset';

  @override
  String get balanceLabel => 'Balance';

  @override
  String get lapsLabel => 'Laps';

  @override
  String get goalLabel => 'Goal';

  @override
  String get tapAnywhere => '⚡ Tap anywhere';

  @override
  String get setGoal => 'Set goal';

  @override
  String get vibrateAtLap => 'The phone vibrates at each completed lap';

  @override
  String get saveLabel => 'Save';

  @override
  String get removeGoal => 'Remove goal';

  @override
  String get adhkarList => 'Adhkar List';

  @override
  String get searchAdhkar => 'Search adhkar...';

  @override
  String get notTrackedYet => 'Not tracked yet';

  @override
  String get statusNotStarted => 'Status: Not started';

  @override
  String lastRead(String value) {
    return 'Last read: $value';
  }

  @override
  String get sleepAdhkar => 'Sleep Adhkar';

  @override
  String get afterPrayerAdhkar => 'After-Prayer Adhkar';

  @override
  String get ruqyah => 'Ruqyah';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String today(String time) {
    return 'Today, $time';
  }

  @override
  String yesterday(String time) {
    return 'Yesterday, $time';
  }

  @override
  String get mySpiritualJourney => 'My Spiritual Journey';

  @override
  String get dhikrBreakdown => 'Dhikr breakdown';

  @override
  String get weekLabel => 'Week';

  @override
  String get monthLabel => 'Month';

  @override
  String get yearLabel => 'Year';

  @override
  String get noDhikrRecorded => 'No dhikr recorded yet';

  @override
  String get hasanatGrowth => 'Hasanat growth';

  @override
  String get overallAdhkarStreak => 'Overall adhkar streak';

  @override
  String consecutiveDays(String count) {
    return '$count consecutive days';
  }

  @override
  String longestOverall(String count) {
    return 'Longest overall: $count days';
  }

  @override
  String get thisWeek => 'This week';

  @override
  String adhkarOutOf21(String count) {
    return '$count / 21 adhkar';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appTheme => 'App theme';

  @override
  String get vibration => 'Vibration';

  @override
  String get dhikrFont => 'Dhikr font';

  @override
  String get clearFont => 'Clear';

  @override
  String get uthmaniFont => 'Uthmani';

  @override
  String get textSize => 'Text size';

  @override
  String get numerals => 'Numerals';

  @override
  String get languageLabel => 'Language';

  @override
  String get errorLoadingAdhkar => 'Error loading adhkar';

  @override
  String get noAdhkarFound => 'No adhkar found';

  @override
  String get listViewLabel => 'List';

  @override
  String get singleViewLabel => 'Single dhikr';

  @override
  String get repetitionCountLabel => 'Repetition count';

  @override
  String ofCount(String count) {
    return 'of $count';
  }

  @override
  String get completedLabel => 'Completed';

  @override
  String get tapToCount => 'Tap to count';

  @override
  String get virtueAndSource => 'Virtue & source';

  @override
  String get shareLabel => 'Share';

  @override
  String get copyLabel => 'Copy';

  @override
  String get copied => 'Copied';

  @override
  String get swipeHint => 'Swipe right or left to move between adhkar';

  @override
  String get appName => 'Bank El Zikr';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get shareRewardWithFriends => 'Share the reward with your friends';

  @override
  String get language => 'Language';
}
