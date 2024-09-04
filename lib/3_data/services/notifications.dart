// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;

// class Notifications {
//   static const morningAzkarId = "sabah";
//   static const masaaAzkarId = "masaa";

//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static AndroidInitializationSettings initializationSettingsAndroid =
//       const AndroidInitializationSettings('@mipmap/ic_launcher');

//   static init() async {
//     // Initialize the timezone database
//     tz.initializeTimeZones();

//     // Get the local timezone and set it
//     // final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     // tz.setLocalLocation(tz.getLocation(timeZoneName));

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse:
//           backgroundNotificationResponseHandler,
//       onDidReceiveNotificationResponse: (details) {
//         print(details.toString());
//         print("Notification clicked");
//       },
//     );
//   }

//   static setMorningAzkar({required DateTime dateTime}) async {
//     // Convert DateTime to TZDateTime
//     // final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     final tz.Location utcLocation = tz.getLocation('UTC');

//     // Add the offset to UTC to create the correct time
//     print(utcLocation.toString());
//     print(dateTime.toString());
//     print(dateTime.timeZoneOffset);
//     final tz.TZDateTime tzDateTime = tz.TZDateTime(
//             utcLocation,
//             dateTime.year,
//             dateTime.month,
//             dateTime.day,
//             dateTime.hour,
//             dateTime.minute,
//             dateTime.second)
//         .add(dateTime.timeZoneOffset)
//         ;
//         print(tzDateTime.toString());
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(morningAzkarId, 'Azkar Morning',
//             channelDescription: 'Morning Azkar Notifications',
//             importance: Importance.max,
//             priority: Priority.high,
//             showWhen: false);

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Morning Azkar',
//         'It is time for your morning Azkar',
//         tzDateTime,
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }
// }

// // Top-level function for background notification response
// void backgroundNotificationResponseHandler(NotificationResponse details) {
//   print("Background Notification clicked: ${details.payload}");
// }
