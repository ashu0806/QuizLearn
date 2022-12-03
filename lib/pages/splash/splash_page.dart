import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: mainGradient(),
          ),
          child: SvgPicture.asset(
            'assets/images/app_splash_logo.svg',
          ),
        ),
      ),
    );
  }
}
