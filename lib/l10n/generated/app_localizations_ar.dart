// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navTasbih => 'المسبحة';

  @override
  String get navAdhkar => 'الأذكار';

  @override
  String get navJourney => 'سجلي';

  @override
  String get homeTitle => 'بنك الذكر';

  @override
  String get homeSubtitle => 'حصنك اليومي';

  @override
  String get totalHasanatBalance => 'رصيد الذكر الكلي';

  @override
  String depositedToday(String count) {
    return 'أودعت اليوم +$count';
  }

  @override
  String get depositMore => 'أودع المزيد +';

  @override
  String get morningAdhkar => 'أذكار الصباح';

  @override
  String get eveningAdhkar => 'أذكار المساء';

  @override
  String get incomplete => 'غير مكتمل';

  @override
  String get done => 'مكتمل';

  @override
  String get streakLabel => 'سلسلة الالتزام';

  @override
  String dayStreakCount(String count) {
    return '$count يوم متتالي';
  }

  @override
  String get streakDescription => 'أكملت أذكارك اليومية دون أن تفوّت يومًا';

  @override
  String streakSince(String date) {
    return 'منذ $date';
  }

  @override
  String get viewStats => 'شاهد الإحصائيات';

  @override
  String get supportTheApp => 'ادعم المطوّر';

  @override
  String get supportSubtitle => 'ساعد في إبقاء بنك الذكر مجانيًا للجميع';

  @override
  String get donate => 'دعم';

  @override
  String get supporterSheetTitle => 'ادعم بنك الذكر';

  @override
  String get supporterSheetBody =>
      'هذا دعم شهري رمزي للمطوّر، وليس صدقة أو تبرعًا خيريًا، ولا يُعد تبرعًا معفى من الضريبة. هدفه فقط الإبقاء على التطبيق مجانيًا ومستمرًا في التطوير.';

  @override
  String get monthlySupporterTierName => 'داعم شهري';

  @override
  String get supporterActiveLabel => 'أنت تدعم هذا التطبيق';

  @override
  String get manageSubscription => 'إدارة الاشتراك';

  @override
  String get subscribeAction => 'اشترك';

  @override
  String subscribeActionWithPrice(Object price) {
    return 'اشترك — $price/شهريًا';
  }

  @override
  String get restorePurchases => 'استعادة المشتريات';

  @override
  String get supporterStatusUnavailable =>
      'تعذّر تحميل حالة الدعم — اضغط لإعادة المحاولة';

  @override
  String get genericErrorMessage => 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى';

  @override
  String get anotherVerse => 'آية أخرى';

  @override
  String get showTranslation => 'عرض الترجمة';

  @override
  String get hideTranslation => 'إخفاء الترجمة';

  @override
  String get shareReward => 'شارك الأجر مع أصدقاءك';

  @override
  String shareAppMessage(String iosLink, String androidLink) {
    return 'بنك الذكر يساعدك على المداومة على أذكارك اليومية، جرّبه:\nآيفون: $iosLink\nأندرويد: $androidLink';
  }

  @override
  String get digitalTasbih => 'السبحة الرقمية';

  @override
  String get errorLoadingCounter => 'حدث خطأ في تحميل العداد';

  @override
  String get resetLabel => 'تصفير';

  @override
  String get balanceLabel => 'الرصيد';

  @override
  String get lapsLabel => 'الأشواط';

  @override
  String get goalLabel => 'الهدف';

  @override
  String get tapAnywhere => 'اضغط في أي مكان';

  @override
  String get setGoal => 'تحديد الهدف';

  @override
  String get vibrateAtLap => 'يهتز الهاتف عند إتمام كل شوط';

  @override
  String get saveLabel => 'حفظ';

  @override
  String get removeGoal => 'إزالة الهدف';

  @override
  String get adhkarList => 'قائمة الأذكار';

  @override
  String get searchAdhkar => 'ابحث عن الأذكار...';

  @override
  String get notTrackedYet => 'غير مُتابَع بعد';

  @override
  String get statusNotStarted => 'الحالة: لم يبدأ';

  @override
  String lastRead(String value) {
    return 'آخر قراءة: $value';
  }

  @override
  String get sleepAdhkar => 'أذكار النوم';

  @override
  String get afterPrayerAdhkar => 'أذكار بعد الصلاة';

  @override
  String get ruqyah => 'الرقية';

  @override
  String get justNow => 'الآن';

  @override
  String minutesAgo(int count) {
    return 'منذ $count د';
  }

  @override
  String hoursAgo(int count) {
    return 'منذ $count س';
  }

  @override
  String get am => 'ص';

  @override
  String get pm => 'م';

  @override
  String today(String time) {
    return 'اليوم، $time';
  }

  @override
  String yesterday(String time) {
    return 'أمس، $time';
  }

  @override
  String get myDhikrLog => 'سجل ذِكري';

  @override
  String get dhikrBreakdown => 'تفصيل الأذكار';

  @override
  String get weekLabel => 'الأسبوع';

  @override
  String get monthLabel => 'الشهر';

  @override
  String get yearLabel => 'السنة';

  @override
  String get noDhikrRecorded => 'لا يوجد ذكر مسجل بعد';

  @override
  String get hasanatGrowth => 'نمو الذكر';

  @override
  String longestStreakLabel(String count) {
    return 'الأطول: $count يوم';
  }

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String adhkarOutOf21(String count) {
    return '$count / 21 ذكر';
  }

  @override
  String get weekdayMon => 'ن';

  @override
  String get weekdayTue => 'ث';

  @override
  String get weekdayWed => 'ر';

  @override
  String get weekdayThu => 'خ';

  @override
  String get weekdayFri => 'ج';

  @override
  String get weekdaySat => 'س';

  @override
  String get weekdaySun => 'ح';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get appTheme => 'مظهر التطبيق';

  @override
  String get vibration => 'الاهتزاز';

  @override
  String get dhikrFont => 'خط الذكر';

  @override
  String get clearFont => 'واضح';

  @override
  String get uthmaniFont => 'عثماني';

  @override
  String get textSize => 'حجم الخط';

  @override
  String get numerals => 'الأرقام';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get notificationsSection => 'الإشعارات';

  @override
  String get adhkarReminders => 'تذكير الأذكار';

  @override
  String get adhkarRemindersSubtitleManual => 'حدد أوقات التذكير بنفسك';

  @override
  String get adhkarRemindersSubtitleAuto => 'متزامن مع الفجر والعصر حسب موقعك';

  @override
  String get timingLabel => 'التوقيت';

  @override
  String get manualLabel => 'يدوي';

  @override
  String get autoLabel => 'تلقائي';

  @override
  String get hoursLabel => 'ساعة';

  @override
  String get minutesLabel => 'دقيقة';

  @override
  String get fajr => 'الفجر';

  @override
  String get asr => 'العصر';

  @override
  String get fajrAndAsr => 'الفجر والعصر';

  @override
  String get locationRequiredForReminders =>
      'إذن الموقع غير مفعّل. فعّله لتطبيق بنك الذكر من إعدادات هاتفك لتتمكن من تفعيل تذكير الأذكار';

  @override
  String get locationServicesOffForReminders =>
      'خدمة الموقع غير مفعّلة في هاتفك. فعّلها من إعدادات هاتفك لتتمكن من تفعيل تذكير الأذكار';

  @override
  String get locationUnavailableForReminders =>
      'تعذّر تحديد موقعك. تحقق من الاتصال وحاول مرة أخرى';

  @override
  String get openSettingsAction => 'فتح الإعدادات';

  @override
  String nextReminderText(String adhkarName, String duration, String time) {
    return '$adhkarName خلال $duration · $time';
  }

  @override
  String durationMinutes(String count) {
    return '$countد';
  }

  @override
  String durationHours(String count) {
    return '$countس';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hoursس $minutesد';
  }

  @override
  String get errorLoadingAdhkar => 'حدث خطأ في تحميل الأذكار';

  @override
  String get noAdhkarFound => 'لا توجد أذكار';

  @override
  String get listViewLabel => 'قائمة';

  @override
  String get singleViewLabel => 'ذكر واحد';

  @override
  String get repetitionCountLabel => 'عدد التكرار';

  @override
  String ofCount(String count) {
    return 'من $count';
  }

  @override
  String get completedLabel => 'اكتمل';

  @override
  String get tapToCount => 'اضغط للعد';

  @override
  String get markCompleted => 'وضع علامة كمكتمل';

  @override
  String get virtueAndSource => 'الفضل والمصدر';

  @override
  String get shareLabel => 'مشاركة';

  @override
  String get shareAsText => 'مشاركة كنص';

  @override
  String get shareAsImage => 'مشاركة كصورة';

  @override
  String get saveImage => 'حفظ الصورة';

  @override
  String get imageSaved => 'تم حفظ الصورة';

  @override
  String get copyLabel => 'نسخ';

  @override
  String get copied => 'تم النسخ';

  @override
  String get swipeHint => 'اسحب يمينًا أو يسارًا للتنقل بين الأذكار';

  @override
  String get appName => 'بنك الذكر';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'موافق';

  @override
  String get settings => 'الإعدادات';

  @override
  String get home => 'الرئيسية';

  @override
  String get welcomeBack => 'مرحبا بعودتك';

  @override
  String get shareRewardWithFriends => 'شارك الأجر مع أصدقاءك';

  @override
  String get language => 'اللغة';

  @override
  String get chooseZikr => 'اختر الذكر';

  @override
  String get translation => 'الترجمة';

  @override
  String get addCustomZikrHint => 'أضف ذكرًا مخصصًا...';

  @override
  String get addCustomZikrTitle => 'أضف ذكرًا مخصصًا';

  @override
  String get addCustomZikrButton => 'إضافة الذكر';

  @override
  String get emptyZikrError => 'الرجاء إدخال نص الذكر';

  @override
  String get onboardingPurposeTitle => 'اذكر الله يومًا بعد يوم';

  @override
  String get onboardingPurposeSubtitle =>
      'سجّل أذكارك، حافظ على سلسلة الالتزام، وتابع رصيدك في مكان واحد';

  @override
  String get onboardingAdhkarBalanceLabel => 'رصيد أذكارك';

  @override
  String get onboardingAdhkarBalanceHint => 'كل ذكر تسجّله يضاف إلى رصيدك';

  @override
  String get onboardingStreakPreview => 'سلسلة الالتزام: ٧ أيام';

  @override
  String get onboardingNotificationTitle => 'لا تفوّت أذكار الصباح والمساء';

  @override
  String get onboardingNotificationSubtitle =>
      'فعّل التنبيهات لتصلك تذكيرات لطيفة في مواعيد الصباح والمساء';

  @override
  String get onboardingEnableNotifications => 'تفعيل التنبيهات';

  @override
  String get onboardingSkipForNow => 'تخطي الآن';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingNotificationEnableFailed =>
      'التذكيرات تحتاج إلى إذن الموقع لتعمل. فعّله لتطبيق بنك الذكر من إعدادات هاتفك في أي وقت';
}
