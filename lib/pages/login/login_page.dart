import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/auth/auth_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/app_light_theme.dart';

class LogInPage extends GetView<AuthController> {
  const LogInPage({super.key});

  static const String routeName = '/login';
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app_splash_logo.png',
                  height: 200.h,
                  width: 200.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'This is a study app. You can use it for learning and practice purpose.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: onSurfaceText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                InkWell(
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                  child: Container(
                    height: 40.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        12.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/google.svg',
                        ),
                        const Spacer(),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: primaryColorLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
