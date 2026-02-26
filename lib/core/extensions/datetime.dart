extension DateTimeExtension on DateTime {
  String readableDate() {
    if (day == DateTime.now().day &&
        month == DateTime.now().month &&
        year == DateTime.now().year) {
      return 'Today $hour:$minute';
    } else {
      return '$day - ${monthName(month)} - $year';
    }
  }

  get readableDateWithTime =>
      '$day - ${monthName(month)} - $year $hour:$minute';

  String abbreviatedMonthName(int month) => abbreviatedMonthNames[month - 1];

  String monthName(int month) => monthNames[month - 1];
  static final abbreviatedMonthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  static final monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  //To date in format dd-MM-yyyy
  String toDDMMYYYFormatText() {
    final String monthStr = month < 10 ? '0$month' : '$month';
    final String dayStr = day < 10 ? '0$day' : '$day';
    return '$dayStr-$monthStr-$year';
  }
}
