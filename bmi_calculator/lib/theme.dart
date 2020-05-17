import 'package:flutter/material.dart';

class CustomTheme {
  static const Color main = Color(0xFF0A0E21);
  static const Color activeCardBackground = Color(0xFF1D1E33);
  static const Color inactiveCardBackground = Color(0xFF111328);
  static const Color bottomContainer = Color(0xFFEB1555);
  static const Color textColor = Color(0xFF8D8E98);

  static ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: main,
      scaffoldBackgroundColor: main,
    );
  }

  static AppBar getAppBar() {
    return AppBar(
      title: Text("BMI Calculator"),
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
