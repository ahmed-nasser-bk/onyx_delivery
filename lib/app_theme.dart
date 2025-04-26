import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff004F62),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: Color(0xff004F62)),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff004F62)),
      bodyLarge: TextStyle(fontSize: 18, color: Color(0xff004F62)),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xff004F62)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff004F62),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
  );
}
