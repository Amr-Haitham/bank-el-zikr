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
  String get navJourney => 'Log';

  @override
  String get homeTitle => 'Bank el Dhikr';

  @override
  String get homeSubtitle => 'Your daily fortress';

  @override
  String get totalHasanatBalance => 'Total dhikr balance';

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
  String get supportTheApp => 'Support the Developer';

  @override
  String get supportSubtitle => 'Help keep Bank el Dhikr free for everyone';

  @override
  String get donate => 'Support';

  @override
  String get supporterSheetTitle => 'Support Bank El Zikr';

  @override
  String get supporterSheetBody =>
      'This is a monthly show of support for the developer — not a religious donation (sadaqah) and not tax-deductible. It simply helps keep this app free and maintained.';

  @override
  String get monthlySupporterTierName => 'Monthly Supporter';

  @override
  String get supporterActiveLabel => 'You\'re supporting this app';

  @override
  String get manageSubscription => 'Manage Subscription';

  @override
  String get subscribeAction => 'Subscribe';

  @override
  String subscribeActionWithPrice(Object price) {
    return 'Subscribe — $price/month';
  }

  @override
  String get restorePurchases => 'Restore Purchases';

  @override
  String get supporterStatusUnavailable =>
      'Couldn\'t load supporter status — tap to try again';

  @override
  String get genericErrorMessage =>
      'Something unexpected happened. Please try again.';

  @override
  String get anotherVerse => 'Another verse';

  @override
  String get showTranslation => 'Show translation';

  @override
  String get hideTranslation => 'Hide translation';

  @override
  String get shareReward => 'Share the reward with friends';

  @override
  String shareAppMessage(String iosLink, String androidLink) {
    return 'Bank El Zikr helps you keep up with your daily Adhkar — try it out:\niPhone: $iosLink\nAndroid: $androidLink';
  }

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
  String get tapAnywhere => 'Tap anywhere';

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
  String get myDhikrLog => 'My Dhikr Log';

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
  String get hasanatGrowth => 'Dhikr growth';

  @override
  String longestStreakLabel(String count) {
    return 'Longest: $count days';
  }

  @override
  String get thisWeek => 'This week';

  @override
  String adhkarOutOf21(String count) {
    return '$count / 21 adhkar';
  }

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

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
  String get notificationsSection => 'Notifications';

  @override
  String get adhkarReminders => 'Adhkar reminders';

  @override
  String get adhkarRemindersSubtitleManual => 'Set your own reminder times';

  @override
  String get adhkarRemindersSubtitleAuto =>
      'Synced to Fajr / Asr for your location';

  @override
  String get timingLabel => 'Timing';

  @override
  String get manualLabel => 'Manual';

  @override
  String get autoLabel => 'Auto';

  @override
  String get hoursLabel => 'Hours';

  @override
  String get minutesLabel => 'Minutes';

  @override
  String get fajr => 'Fajr';

  @override
  String get asr => 'Asr';

  @override
  String get fajrAndAsr => 'Fajr & Asr';

  @override
  String get locationRequiredForReminders =>
      'Location access is off. Enable it for Bank El Zikr in your phone\'s Settings app to turn on Adhkar reminders';

  @override
  String get locationServicesOffForReminders =>
      'Location services are off on your phone. Turn on Location in your phone\'s Settings to turn on Adhkar reminders';

  @override
  String get locationUnavailableForReminders =>
      'Couldn\'t get your location. Check your connection and try again';

  @override
  String get openSettingsAction => 'Open Settings';

  @override
  String nextReminderText(String adhkarName, String duration, String time) {
    return '$adhkarName in $duration · $time';
  }

  @override
  String durationMinutes(String count) {
    return '${count}m';
  }

  @override
  String durationHours(String count) {
    return '${count}h';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '${hours}h ${minutes}m';
  }

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
  String get markCompleted => 'Mark as completed';

  @override
  String get details => 'Details';

  @override
  String get shareLabel => 'Share';

  @override
  String get shareAsText => 'Share as text';

  @override
  String get shareAsImage => 'Share as image';

  @override
  String get saveImage => 'Save image';

  @override
  String get imageSaved => 'Image saved';

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

  @override
  String get chooseZikr => 'Choose a Zikr';

  @override
  String get translation => 'Translation';

  @override
  String get addCustomZikrHint => 'Add a custom zikr...';

  @override
  String get addCustomZikrTitle => 'Add a Custom Zikr';

  @override
  String get addCustomZikrButton => 'Add Zikr';

  @override
  String get emptyZikrError => 'Please enter the zikr text';

  @override
  String get onboardingPurposeTitle => 'Grow your dhikr, day after day';

  @override
  String get onboardingPurposeSubtitle =>
      'Track your Adhkar, build your streak, and watch your balance grow';

  @override
  String get onboardingAdhkarBalanceLabel => 'Your Adhkar balance';

  @override
  String get onboardingAdhkarBalanceHint =>
      'Every zikr you log adds to your balance';

  @override
  String get onboardingStreakPreview => 'Streak: 7 days';

  @override
  String get onboardingNotificationTitle =>
      'Never miss your morning & evening Adhkar';

  @override
  String get onboardingNotificationSubtitle =>
      'Turn on notifications for gentle reminders at Sabah & Masaa\' time';

  @override
  String get onboardingEnableNotifications => 'Enable notifications';

  @override
  String get onboardingSkipForNow => 'Skip for now';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingNotificationEnableFailed =>
      'Reminders need location access to work. Enable it for Bank El Zikr in your phone\'s Settings app anytime';
}
