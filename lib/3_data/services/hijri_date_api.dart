// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../models/hijri_date.dart';

// class HijriDateApi {
//   final String _baseUrl = 'https://api.aladhan.com/v1/gToH';

//   Future<HijriDate> getTodaysHijriDate() async {
//     final now = DateTime.now();
//     print(now.toString());
    
//     // Format the date as DD-MM-YYYY
//     final formattedDate =
//         '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}';

//     final url = '$_baseUrl/$formattedDate';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print(response.body);
//         if (data['data'] != null && data['data']['hijri'] != null) {
//           return HijriDate(
//             day: data['data']['hijri']['day'].toString(),
//             month: data['data']['hijri']['month']['number'].toString(),
//             year: data['data']['hijri']['year'].toString(),
//             weekDayName: data['data']['hijri']['weekday']["ar"].toString(),
//             date: data['data']['hijri']['date'].toString(),
//             monthName: data['data']['hijri']['month']['ar'].toString(),
//           );
//         } else {
//           throw Exception('Unexpected API response structure');
//         }
//       } else {
//         throw Exception(
//             'Failed to load Hijri date. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching Hijri date: $e');
//     }
//   }
// }
