import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTheme {
  AppTheme._();
  //amr change all colors here
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: createMaterialColor(const Color.fromRGBO(255, 89, 97, 1)),
    primaryColor: Color.fromRGBO(52, 199, 89, 1.0),

    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color.fromARGB(101, 255, 89, 97),
        selectionHandleColor: Color(0xffFF5961)),
    scaffoldBackgroundColor: const Color(0xffffffff),
    fontFamily: GoogleFonts.tajawal().fontFamily,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14, color: Colors.black),
    ),
    dialogBackgroundColor: Colors.white,
    // unselectedWidgetColor: Colors.grey,
    // dividerColor: Colors.grey[300],
    cardColor:Color.fromRGBO(237, 250, 237, 1) ,
    dialogTheme: DialogTheme(shape: dialogShape()),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 255, 246, 247),
      iconTheme: IconThemeData(
        color: Colors.black, // Change the color of the back button here.
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: createMaterialColor(const Color(0xffFF5961)),
    brightness: Brightness.dark,
    primaryColor: const Color(0xff30D158),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color.fromARGB(137, 255, 89, 97),
        selectionHandleColor: Color(0xffFF5961)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    fontFamily: GoogleFonts.tajawal().fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff000000),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodySmall: TextStyle(fontSize: 14, color: Colors.white),
    ),
    dialogBackgroundColor: const Color(0xff1E1E1E),
    // unselectedWidgetColor: Colors.white60,
    // dividerColor: Colors.white12,
    cardColor: const Color.fromRGBO(29, 57, 33, 1),
    dialogTheme: DialogTheme(shape: dialogShape()),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white, // Change the color of the back button here.
      ),
      backgroundColor: Color(0xff27313D),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
