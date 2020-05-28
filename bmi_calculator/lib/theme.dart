import 'package:flutter/material.dart';

class CustomTheme {
  static const Color main = Color(0xFF0A0E21);
  static const Color activeCardBackground = Color(0xFF1D1E33);
  static const Color inactiveCardBackground = Color(0xFF111328);
  static const Color bottomContainer = Color(0xFFEB1555);
  static const Color activeColor = Color(0xFFEB1555);
  static const Color textColor = Color(0xFF8D8E98);
  static const Color roundButtonColor = Color(0xFF4C4F5E);

  static const largeFontSize = 45.9;
  static const mediumFontSize = 23.50;
  static const regularFontSize = 18.8;
  static const smallFontSize = 12.03;

  static const smallTextStyle = TextStyle(
    fontSize: smallFontSize,
    color: CustomTheme.textColor,
  );

  static const regularTextStyle = TextStyle(
    fontSize: regularFontSize,
    color: CustomTheme.textColor,
  );

  static const largeTextStyle = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w900,
  );

  static const bottomTextStyle = TextStyle(
    fontSize: mediumFontSize,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );

  static final theme = ThemeData.dark().copyWith(
    primaryColor: main,
    scaffoldBackgroundColor: main,
  );

  static final appBar = AppBar(
    title: Text(
      "BMI Calculator",
    ),
    elevation: 0.0,
    centerTitle: true,
  );
}
