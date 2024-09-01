import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/hijri_date.dart';

class HijriDateApi {
  final String _baseUrl = 'https://api.aladhan.com/v1/gToH';

  Future<HijriDate> getTodaysHijriDate() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return HijriDate.fromJson(data);
    } else {
      throw Exception('Failed to load Hijri date');
    }
  }
}
