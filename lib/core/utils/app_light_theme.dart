import 'package:flutter/material.dart';
import 'package:quiz_learn/core/utils/app_theme.dart';

const Color primaryDullColorLight = Color(0xff3ac3cb);
const Color primaryColorLight = Color(0xfff85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with AppTheme {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme: getIconTheme(),
      primaryColor: primaryColorLight,
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
