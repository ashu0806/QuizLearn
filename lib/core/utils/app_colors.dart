import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/core/utils/app_dark_theme.dart';
import 'package:quiz_learn/core/utils/app_light_theme.dart';
import 'package:quiz_learn/core/utils/ui_parameters.dart';

const Color onSurfaceText = Colors.white;
const Color correctAnswerColor = Color(0xff3ac3cb);
const Color wrongAnswerColor = Color.fromARGB(255, 255, 65, 51);
const Color notAnsweredColor = Color(0x0ff85187);

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

LinearGradient mainGradient() {
  return UiParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
}

Color customScaffoldColor(BuildContext context) => UiParameters.isDarkMode()
    ? const Color(0xff2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UiParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UiParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
