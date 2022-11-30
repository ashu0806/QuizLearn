import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';

mixin AppTheme {
  TextTheme getTextThemes() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(
      color: onSurfaceText,
      size: 16,
    );
  }
}
