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
  String get navJourney => 'رصدي';

  @override
  String get homeTitle => 'بنك الذكر';

  @override
  String get homeSubtitle => 'حصنك اليومي';

  @override
  String get totalHasanatBalance => 'رصيد الحسنات الكلي';

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
  String get supportTheApp => 'ادعم التطبيق';

  @override
  String get supportSubtitle => 'ساعد في إبقاء بنك الذكر مجانيًا للجميع';

  @override
  String get donate => 'تبرع';

  @override
  String get anotherVerse => 'آية أخرى';

  @override
  String get showTranslation => 'إظهار الترجمة';

  @override
  String get hideTranslation => 'إخفاء الترجمة';

  @override
  String get shareReward => 'شارك الأجر مع أصدقاءك';

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
  String get mySpiritualJourney => 'رحلتي الروحية';

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
  String get hasanatGrowth => 'نمو الحسنات';

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
      'يلزم الوصول إلى الموقع لتفعيل تذكير الأذكار';

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
  String get addCustomZikrHint => 'أضف ذكرًا مخصصًا...';

  @override
  String get addCustomZikrTitle => 'أضف ذكرًا مخصصًا';

  @override
  String get addCustomZikrButton => 'إضافة الذكر';

  @override
  String get emptyZikrError => 'الرجاء إدخال نص الذكر';
}
