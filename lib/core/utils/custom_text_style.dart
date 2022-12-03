import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
      fontSize: 18.sp,
      color: UiParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );

var detailText = TextStyle(
  fontSize: 13.sp,
);
var headerText = TextStyle(
  fontSize: 18.sp,
  color: onSurfaceText,
  fontWeight: FontWeight.bold,
);

TextStyle countDounTimerStyle() => TextStyle(
      letterSpacing: 2,
      color: UiParameters.isDarkMode()
          ? Theme.of(Get.context!).textTheme.bodyText1!.color
          : Theme.of(Get.context!).primaryColor,
    );
