import 'package:flutter/material.dart';

enum AppTheme {
  ClassicBlue,
  DarkRed,
}

final darkTheme = ThemeData.dark();
final lightTheme = ThemeData.light();
final appThemeData = {
  AppTheme.ClassicBlue: ThemeData.light().copyWith(
      primaryColor: Color(0xFF3229bf),
      accentColor: Color(0xFF4568ff),
      buttonColor: Color(0xFF3229bf),
      iconTheme: IconThemeData(color: Color(0xFF656565), opacity: 1.0, size: 24.0),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      )),
  AppTheme.DarkRed: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    accentColor: Colors.redAccent,
    buttonColor: Color(0xFFB30000),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
};
