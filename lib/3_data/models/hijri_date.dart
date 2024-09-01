import 'package:arabic_numbers/arabic_numbers.dart';

class HijriDate {
  final String day;
  final String month;
  final String year;
  final String monthName;
  final String weekDayName;
  final String date;
  String fromObjectToFullDateString() {
    return '${ArabicNumbers().convert(day)} $monthName ${ArabicNumbers().convert(year)} هجري';
  }

  HijriDate({
    required this.day,
    required this.month,
    required this.year,
    required this.monthName,
    required this.weekDayName,
    required this.date,
  });

  // Factory method to create an instance of HijriDate from JSON data
  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      day: json['data']['hijri']['day'],
      month: json['data']['hijri']['month']['number'].toString(),
      year: json['data']['hijri']['year'],
      monthName: json['data']['hijri']['month']['ar'],
      weekDayName: json['data']['hijri']['weekday']['ar'],
      date: json['data']['hijri']['date'],
    );
  }
}
