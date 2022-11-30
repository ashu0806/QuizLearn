import 'package:flutter/material.dart';
import 'package:quiz_learn/core/utils/app_dark_theme.dart';
import 'package:quiz_learn/core/utils/app_light_theme.dart';
import 'package:quiz_learn/core/utils/ui_parameters.dart';

const Color onSurfaceText = Colors.white;
const mainGradientLight = LinearGradient(
  colors: [
    primaryDullColorLight,
    primaryColorLight,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const mainGradientDark = LinearGradient(
  colors: [
    primaryDullColorDark,
    primaryColorDark,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient mainGradient(BuildContext context) {
  return UiParameters.isDarkMode(context)
      ? mainGradientDark
      : mainGradientLight;
}
