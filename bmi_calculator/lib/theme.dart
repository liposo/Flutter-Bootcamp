import 'package:flutter/material.dart';

class CustomTheme {
  static Color main = Color(0xFF0A0E21);
  static Color cardBackground = Color(0xFF1D1E33);

  static ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: main,
      scaffoldBackgroundColor: main,
    );
  }
}
