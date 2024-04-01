import 'package:flutter/material.dart';

class DefaultTheme {
  static Color get accentColor => const Color.fromARGB(255, 62, 74, 237);
  static Color get base100Color => const Color(0xFFFFFFFF);
  static Color get base900Color => const Color.fromARGB(255, 21, 24, 29);
  static Color get darkColor => const Color(0xFF121212);
  static Color get errorColor => const Color(0xFFF87171);
  static Color get grayColor => const Color.fromARGB(255, 212, 212, 212);
  static Color get infoColor => const Color(0xFFBAE6FD);
  static Color get neutralColor => const Color(0xFFFFFFFF);
  static Color get primaryColor => const Color(0xff8F57FF);
  static Color get primaryColorDark => const Color(0xFF4A1DA1);
  static Color get secondaryColor => const Color(0xffEEE5FF);
  static Color get successColor => const Color(0xFF4ADE80);
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: neutralColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: neutralColor,
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: neutralColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          color: base900Color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      fontFamily: "Inter",
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        titleLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: base900Color,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: base900Color,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // prefixIconColor: base900Color,
        // prefixStyle: TextStyle(
        //   color: base900Color,
        // ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        fillColor: base100Color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: base900Color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: base900Color,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
      ),
    );
  }

  static Color get warningColor => const Color(0xFFFEF08A);

  DefaultTheme._();
}
