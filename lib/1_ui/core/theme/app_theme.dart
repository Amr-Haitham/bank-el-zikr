import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:nb_utils/nb_utils.dart';

class AppTheme {
  AppTheme._();

  // Custom dialog shape function to replace nb_utils dependency
  static RoundedRectangleBorder dialogShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    );
  }

  //amr change all colors here
  static final ThemeData lightTheme = ThemeData(
    // primarySwatch: createMaterialColor(const Color.fromRGBO(255, 89, 97, 1)),
    primaryColor: const Color(0xff34C759),

    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: appDark,
        selectionColor: Color.fromRGBO(52, 199, 89, 0.438),
        selectionHandleColor: Color.fromRGBO(52, 199, 89, 1.0)),
    scaffoldBackgroundColor: const Color(0xffffffff),
    fontFamily: GoogleFonts.tajawal().fontFamily,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: appWhite),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 24, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
      bodySmall: TextStyle(fontSize: 16, color: Colors.black),
    ),
    dialogBackgroundColor: Colors.white,
    // unselectedWidgetColor: Colors.grey,
    // dividerColor: Colors.grey[300],
    cardColor: const Color.fromRGBO(237, 250, 237, 1),
    dialogTheme: DialogThemeData(shape: AppTheme.dialogShape()),
    // appBarTheme: const AppBarTheme(
    //   color: Color.fromARGB(255, 255, 246, 247),
    //   iconTheme: IconThemeData(
    //     color: Colors.black, // Change the color of the back button here.
    //   ),
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.light,
    //   ),
    // ),
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
    // primarySwatch: createMaterialColor(const Color(0xffFF5961)),
    brightness: Brightness.dark,
    primaryColor: const Color(0xff30D158),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: appWhite,
        selectionColor: Color.fromRGBO(52, 199, 89, 0.438),
        selectionHandleColor: Color.fromRGBO(52, 199, 89, 1.0)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    fontFamily: GoogleFonts.tajawal().fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff000000),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 24, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 20, color: Colors.white),
      bodySmall: TextStyle(fontSize: 16, color: Colors.white),
    ),
    dialogBackgroundColor: const Color(0xff1E1E1E),
    // unselectedWidgetColor: Colors.white60,
    // dividerColor: Colors.white12,
    cardColor: const Color.fromRGBO(29, 57, 33, 1),
    dialogTheme: DialogThemeData(shape: AppTheme.dialogShape()),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: appDark, // Change the color of the back button here.
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
