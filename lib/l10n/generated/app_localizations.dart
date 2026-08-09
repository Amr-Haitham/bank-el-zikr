import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @navHome.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get navHome;

  /// No description provided for @navTasbih.
  ///
  /// In ar, this message translates to:
  /// **'المسبحة'**
  String get navTasbih;

  /// No description provided for @navAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'الأذكار'**
  String get navAdhkar;

  /// No description provided for @navJourney.
  ///
  /// In ar, this message translates to:
  /// **'رصدي'**
  String get navJourney;

  /// No description provided for @homeTitle.
  ///
  /// In ar, this message translates to:
  /// **'بنك الذكر'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'حصنك اليومي'**
  String get homeSubtitle;

  /// No description provided for @totalHasanatBalance.
  ///
  /// In ar, this message translates to:
  /// **'رصيد الحسنات الكلي'**
  String get totalHasanatBalance;

  /// No description provided for @depositedToday.
  ///
  /// In ar, this message translates to:
  /// **'أودعت اليوم +{count}'**
  String depositedToday(String count);

  /// No description provided for @depositMore.
  ///
  /// In ar, this message translates to:
  /// **'أودع المزيد +'**
  String get depositMore;

  /// No description provided for @morningAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار الصباح'**
  String get morningAdhkar;

  /// No description provided for @eveningAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار المساء'**
  String get eveningAdhkar;

  /// No description provided for @incomplete.
  ///
  /// In ar, this message translates to:
  /// **'غير مكتمل'**
  String get incomplete;

  /// No description provided for @done.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get done;

  /// No description provided for @streakLabel.
  ///
  /// In ar, this message translates to:
  /// **'سلسلة الالتزام'**
  String get streakLabel;

  /// No description provided for @dayStreakCount.
  ///
  /// In ar, this message translates to:
  /// **'{count} يوم متتالي'**
  String dayStreakCount(String count);

  /// No description provided for @streakDescription.
  ///
  /// In ar, this message translates to:
  /// **'أكملت أذكارك اليومية دون أن تفوّت يومًا'**
  String get streakDescription;

  /// No description provided for @streakSince.
  ///
  /// In ar, this message translates to:
  /// **'منذ {date}'**
  String streakSince(String date);

  /// No description provided for @viewStats.
  ///
  /// In ar, this message translates to:
  /// **'شاهد الإحصائيات'**
  String get viewStats;

  /// No description provided for @supportTheApp.
  ///
  /// In ar, this message translates to:
  /// **'ادعم التطبيق'**
  String get supportTheApp;

  /// No description provided for @supportSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ساعد في إبقاء بنك الذكر مجانيًا للجميع'**
  String get supportSubtitle;

  /// No description provided for @donate.
  ///
  /// In ar, this message translates to:
  /// **'تبرع'**
  String get donate;

  /// No description provided for @anotherVerse.
  ///
  /// In ar, this message translates to:
  /// **'آية أخرى'**
  String get anotherVerse;

  /// No description provided for @showTranslation.
  ///
  /// In ar, this message translates to:
  /// **'إظهار الترجمة'**
  String get showTranslation;

  /// No description provided for @hideTranslation.
  ///
  /// In ar, this message translates to:
  /// **'إخفاء الترجمة'**
  String get hideTranslation;

  /// No description provided for @shareReward.
  ///
  /// In ar, this message translates to:
  /// **'شارك الأجر مع أصدقاءك'**
  String get shareReward;

  /// No description provided for @digitalTasbih.
  ///
  /// In ar, this message translates to:
  /// **'السبحة الرقمية'**
  String get digitalTasbih;

  /// No description provided for @errorLoadingCounter.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل العداد'**
  String get errorLoadingCounter;

  /// No description provided for @resetLabel.
  ///
  /// In ar, this message translates to:
  /// **'تصفير'**
  String get resetLabel;

  /// No description provided for @balanceLabel.
  ///
  /// In ar, this message translates to:
  /// **'الرصيد'**
  String get balanceLabel;

  /// No description provided for @lapsLabel.
  ///
  /// In ar, this message translates to:
  /// **'الأشواط'**
  String get lapsLabel;

  /// No description provided for @goalLabel.
  ///
  /// In ar, this message translates to:
  /// **'الهدف'**
  String get goalLabel;

  /// No description provided for @tapAnywhere.
  ///
  /// In ar, this message translates to:
  /// **'اضغط في أي مكان'**
  String get tapAnywhere;

  /// No description provided for @setGoal.
  ///
  /// In ar, this message translates to:
  /// **'تحديد الهدف'**
  String get setGoal;

  /// No description provided for @vibrateAtLap.
  ///
  /// In ar, this message translates to:
  /// **'يهتز الهاتف عند إتمام كل شوط'**
  String get vibrateAtLap;

  /// No description provided for @saveLabel.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get saveLabel;

  /// No description provided for @removeGoal.
  ///
  /// In ar, this message translates to:
  /// **'إزالة الهدف'**
  String get removeGoal;

  /// No description provided for @adhkarList.
  ///
  /// In ar, this message translates to:
  /// **'قائمة الأذكار'**
  String get adhkarList;

  /// No description provided for @searchAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن الأذكار...'**
  String get searchAdhkar;

  /// No description provided for @notTrackedYet.
  ///
  /// In ar, this message translates to:
  /// **'غير مُتابَع بعد'**
  String get notTrackedYet;

  /// No description provided for @statusNotStarted.
  ///
  /// In ar, this message translates to:
  /// **'الحالة: لم يبدأ'**
  String get statusNotStarted;

  /// No description provided for @lastRead.
  ///
  /// In ar, this message translates to:
  /// **'آخر قراءة: {value}'**
  String lastRead(String value);

  /// No description provided for @sleepAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار النوم'**
  String get sleepAdhkar;

  /// No description provided for @afterPrayerAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار بعد الصلاة'**
  String get afterPrayerAdhkar;

  /// No description provided for @ruqyah.
  ///
  /// In ar, this message translates to:
  /// **'الرقية'**
  String get ruqyah;

  /// No description provided for @justNow.
  ///
  /// In ar, this message translates to:
  /// **'الآن'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In ar, this message translates to:
  /// **'منذ {count} د'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In ar, this message translates to:
  /// **'منذ {count} س'**
  String hoursAgo(int count);

  /// No description provided for @am.
  ///
  /// In ar, this message translates to:
  /// **'ص'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In ar, this message translates to:
  /// **'م'**
  String get pm;

  /// No description provided for @today.
  ///
  /// In ar, this message translates to:
  /// **'اليوم، {time}'**
  String today(String time);

  /// No description provided for @yesterday.
  ///
  /// In ar, this message translates to:
  /// **'أمس، {time}'**
  String yesterday(String time);

  /// No description provided for @mySpiritualJourney.
  ///
  /// In ar, this message translates to:
  /// **'رحلتي الروحية'**
  String get mySpiritualJourney;

  /// No description provided for @dhikrBreakdown.
  ///
  /// In ar, this message translates to:
  /// **'تفصيل الأذكار'**
  String get dhikrBreakdown;

  /// No description provided for @weekLabel.
  ///
  /// In ar, this message translates to:
  /// **'الأسبوع'**
  String get weekLabel;

  /// No description provided for @monthLabel.
  ///
  /// In ar, this message translates to:
  /// **'الشهر'**
  String get monthLabel;

  /// No description provided for @yearLabel.
  ///
  /// In ar, this message translates to:
  /// **'السنة'**
  String get yearLabel;

  /// No description provided for @noDhikrRecorded.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد ذكر مسجل بعد'**
  String get noDhikrRecorded;

  /// No description provided for @hasanatGrowth.
  ///
  /// In ar, this message translates to:
  /// **'نمو الحسنات'**
  String get hasanatGrowth;

  /// No description provided for @longestStreakLabel.
  ///
  /// In ar, this message translates to:
  /// **'الأطول: {count} يوم'**
  String longestStreakLabel(String count);

  /// No description provided for @thisWeek.
  ///
  /// In ar, this message translates to:
  /// **'هذا الأسبوع'**
  String get thisWeek;

  /// No description provided for @adhkarOutOf21.
  ///
  /// In ar, this message translates to:
  /// **'{count} / 21 ذكر'**
  String adhkarOutOf21(String count);

  /// No description provided for @weekdayMon.
  ///
  /// In ar, this message translates to:
  /// **'ن'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In ar, this message translates to:
  /// **'ث'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In ar, this message translates to:
  /// **'ر'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In ar, this message translates to:
  /// **'خ'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In ar, this message translates to:
  /// **'ج'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In ar, this message translates to:
  /// **'س'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In ar, this message translates to:
  /// **'ح'**
  String get weekdaySun;

  /// No description provided for @settingsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settingsTitle;

  /// No description provided for @appTheme.
  ///
  /// In ar, this message translates to:
  /// **'مظهر التطبيق'**
  String get appTheme;

  /// No description provided for @vibration.
  ///
  /// In ar, this message translates to:
  /// **'الاهتزاز'**
  String get vibration;

  /// No description provided for @dhikrFont.
  ///
  /// In ar, this message translates to:
  /// **'خط الذكر'**
  String get dhikrFont;

  /// No description provided for @clearFont.
  ///
  /// In ar, this message translates to:
  /// **'واضح'**
  String get clearFont;

  /// No description provided for @uthmaniFont.
  ///
  /// In ar, this message translates to:
  /// **'عثماني'**
  String get uthmaniFont;

  /// No description provided for @textSize.
  ///
  /// In ar, this message translates to:
  /// **'حجم الخط'**
  String get textSize;

  /// No description provided for @numerals.
  ///
  /// In ar, this message translates to:
  /// **'الأرقام'**
  String get numerals;

  /// No description provided for @languageLabel.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get languageLabel;

  /// No description provided for @notificationsSection.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notificationsSection;

  /// No description provided for @adhkarReminders.
  ///
  /// In ar, this message translates to:
  /// **'تذكير الأذكار'**
  String get adhkarReminders;

  /// No description provided for @adhkarRemindersSubtitleManual.
  ///
  /// In ar, this message translates to:
  /// **'حدد أوقات التذكير بنفسك'**
  String get adhkarRemindersSubtitleManual;

  /// No description provided for @adhkarRemindersSubtitleAuto.
  ///
  /// In ar, this message translates to:
  /// **'متزامن مع الفجر والعصر حسب موقعك'**
  String get adhkarRemindersSubtitleAuto;

  /// No description provided for @timingLabel.
  ///
  /// In ar, this message translates to:
  /// **'التوقيت'**
  String get timingLabel;

  /// No description provided for @manualLabel.
  ///
  /// In ar, this message translates to:
  /// **'يدوي'**
  String get manualLabel;

  /// No description provided for @autoLabel.
  ///
  /// In ar, this message translates to:
  /// **'تلقائي'**
  String get autoLabel;

  /// No description provided for @hoursLabel.
  ///
  /// In ar, this message translates to:
  /// **'ساعة'**
  String get hoursLabel;

  /// No description provided for @minutesLabel.
  ///
  /// In ar, this message translates to:
  /// **'دقيقة'**
  String get minutesLabel;

  /// No description provided for @fajr.
  ///
  /// In ar, this message translates to:
  /// **'الفجر'**
  String get fajr;

  /// No description provided for @asr.
  ///
  /// In ar, this message translates to:
  /// **'العصر'**
  String get asr;

  /// No description provided for @fajrAndAsr.
  ///
  /// In ar, this message translates to:
  /// **'الفجر والعصر'**
  String get fajrAndAsr;

  /// No description provided for @locationRequiredForReminders.
  ///
  /// In ar, this message translates to:
  /// **'يلزم الوصول إلى الموقع لتفعيل تذكير الأذكار'**
  String get locationRequiredForReminders;

  /// No description provided for @generalDhikrReminderTitle.
  ///
  /// In ar, this message translates to:
  /// **'تذكير بفضل الذكر'**
  String get generalDhikrReminderTitle;

  /// No description provided for @generalDhikrReminderSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تذكير لطيف يوميًا بأجر الذكر'**
  String get generalDhikrReminderSubtitle;

  /// No description provided for @generalDhikrReminderLanguageLabel.
  ///
  /// In ar, this message translates to:
  /// **'لغة الرسالة'**
  String get generalDhikrReminderLanguageLabel;

  /// No description provided for @nextReminderText.
  ///
  /// In ar, this message translates to:
  /// **'{adhkarName} خلال {duration} · {time}'**
  String nextReminderText(String adhkarName, String duration, String time);

  /// No description provided for @durationMinutes.
  ///
  /// In ar, this message translates to:
  /// **'{count}د'**
  String durationMinutes(String count);

  /// No description provided for @durationHours.
  ///
  /// In ar, this message translates to:
  /// **'{count}س'**
  String durationHours(String count);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In ar, this message translates to:
  /// **'{hours}س {minutes}د'**
  String durationHoursMinutes(String hours, String minutes);

  /// No description provided for @errorLoadingAdhkar.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل الأذكار'**
  String get errorLoadingAdhkar;

  /// No description provided for @noAdhkarFound.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد أذكار'**
  String get noAdhkarFound;

  /// No description provided for @listViewLabel.
  ///
  /// In ar, this message translates to:
  /// **'قائمة'**
  String get listViewLabel;

  /// No description provided for @singleViewLabel.
  ///
  /// In ar, this message translates to:
  /// **'ذكر واحد'**
  String get singleViewLabel;

  /// No description provided for @repetitionCountLabel.
  ///
  /// In ar, this message translates to:
  /// **'عدد التكرار'**
  String get repetitionCountLabel;

  /// No description provided for @ofCount.
  ///
  /// In ar, this message translates to:
  /// **'من {count}'**
  String ofCount(String count);

  /// No description provided for @completedLabel.
  ///
  /// In ar, this message translates to:
  /// **'اكتمل'**
  String get completedLabel;

  /// No description provided for @tapToCount.
  ///
  /// In ar, this message translates to:
  /// **'اضغط للعد'**
  String get tapToCount;

  /// No description provided for @markCompleted.
  ///
  /// In ar, this message translates to:
  /// **'وضع علامة كمكتمل'**
  String get markCompleted;

  /// No description provided for @virtueAndSource.
  ///
  /// In ar, this message translates to:
  /// **'الفضل والمصدر'**
  String get virtueAndSource;

  /// No description provided for @shareLabel.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get shareLabel;

  /// No description provided for @shareAsText.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة كنص'**
  String get shareAsText;

  /// No description provided for @shareAsImage.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة كصورة'**
  String get shareAsImage;

  /// No description provided for @saveImage.
  ///
  /// In ar, this message translates to:
  /// **'حفظ الصورة'**
  String get saveImage;

  /// No description provided for @imageSaved.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ الصورة'**
  String get imageSaved;

  /// No description provided for @copyLabel.
  ///
  /// In ar, this message translates to:
  /// **'نسخ'**
  String get copyLabel;

  /// No description provided for @copied.
  ///
  /// In ar, this message translates to:
  /// **'تم النسخ'**
  String get copied;

  /// No description provided for @swipeHint.
  ///
  /// In ar, this message translates to:
  /// **'اسحب يمينًا أو يسارًا للتنقل بين الأذكار'**
  String get swipeHint;

  /// The application name shown on splash/about screens
  ///
  /// In ar, this message translates to:
  /// **'بنك الذكر'**
  String get appName;

  /// Generic save action button label
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// Generic cancel action button label
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// Generic confirmation button label
  ///
  /// In ar, this message translates to:
  /// **'موافق'**
  String get ok;

  /// Settings screen title
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// Home screen title / nav label
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// Home screen welcome-back greeting
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بعودتك'**
  String get welcomeBack;

  /// Home screen share-app-with-friends prompt
  ///
  /// In ar, this message translates to:
  /// **'شارك الأجر مع أصدقاءك'**
  String get shareRewardWithFriends;

  /// Settings screen language toggle label
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// Tasbih zikr-picker bottom sheet title
  ///
  /// In ar, this message translates to:
  /// **'اختر الذكر'**
  String get chooseZikr;

  /// Placeholder text for the inline add-custom-zikr text field
  ///
  /// In ar, this message translates to:
  /// **'أضف ذكرًا مخصصًا...'**
  String get addCustomZikrHint;

  /// Title of the add-custom-zikr popup
  ///
  /// In ar, this message translates to:
  /// **'أضف ذكرًا مخصصًا'**
  String get addCustomZikrTitle;

  /// Submit button label on the add-custom-zikr popup
  ///
  /// In ar, this message translates to:
  /// **'إضافة الذكر'**
  String get addCustomZikrButton;

  /// Validation message when submitting an empty custom zikr
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إدخال نص الذكر'**
  String get emptyZikrError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
