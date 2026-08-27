import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static RoundedRectangleBorder dialogShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    );
  }

  static const _lightColorScheme = ColorScheme.light(
    primary: primaryGreen,
    onPrimary: surfaceLight,
    secondary: secondaryGold,
    onSecondary: onSurfaceLight,
    surface: surfaceLight,
    onSurface: onSurfaceLight,
    surfaceContainerHighest: surfaceMutedLight,
    primaryContainer: primaryContainerLight,
    outline: outlineLight,
    error: appRed,
  );

  static const _darkColorScheme = ColorScheme.dark(
    primary: primaryGreen,
    onPrimary: onSurfaceDark,
    secondary: secondaryGold,
    onSecondary: onSurfaceDark,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    surfaceContainerHighest: surfaceMutedDark,
    primaryContainer: primaryContainerDark,
    outline: outlineDark,
    error: appRed,
  );

  static TextTheme _textTheme(Color onSurface, Color onSurfaceMuted) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 34,
        fontWeight: FontWeight.w900,
        color: onSurface,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: onSurface,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: onSurface,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: onSurface,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: onSurface,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: onSurface,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: onSurface,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: onSurface,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: onSurfaceMuted,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: onSurface,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: onSurfaceMuted,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: onSurfaceMuted,
      ),
    );
  }

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    primaryColor: primaryGreen,
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: appDark,
        selectionColor: Color.fromRGBO(52, 199, 89, 0.438),
        selectionHandleColor: Color.fromRGBO(52, 199, 89, 1.0)),
    scaffoldBackgroundColor: backgroundLight,
    fontFamily: 'Tajawal',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surfaceLight,
    ),
    iconTheme: const IconThemeData(color: appWhite),
    textTheme: _textTheme(onSurfaceLight, onSurfaceMutedLight),
    cardColor: surfaceLight,
    dialogTheme: DialogThemeData(
      shape: AppTheme.dialogShape(),
      backgroundColor: surfaceLight,
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
    colorScheme: _darkColorScheme,
    brightness: Brightness.dark,
    primaryColor: primaryGreen,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: appWhite,
        selectionColor: Color.fromRGBO(52, 199, 89, 0.438),
        selectionHandleColor: Color.fromRGBO(52, 199, 89, 1.0)),
    scaffoldBackgroundColor: backgroundDark,
    fontFamily: 'Tajawal',
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surfaceDark,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: _textTheme(onSurfaceDark, onSurfaceMutedDark),
    cardColor: surfaceDark,
    dialogTheme: DialogThemeData(
      shape: AppTheme.dialogShape(),
      backgroundColor: dialogBackgroundDark,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: appDark,
      ),
      backgroundColor: appBarBackgroundDark,
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
