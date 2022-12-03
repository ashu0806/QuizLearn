import 'package:flutter/material.dart';
import 'package:quiz_learn/core/utils/app_theme.dart';

const Color primaryDullColorDark = Color(0xff99ace1);
const Color primaryColorDark = Color(0xff2e3c62);
const Color mainTextColorDark = Colors.white;
const Color cardColor = Color(0xff99ace1);

class DarkTheme with AppTheme {
  ThemeData builDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
