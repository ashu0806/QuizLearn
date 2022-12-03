import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/widgets/circle_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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
                Icon(
                  Icons.star,
                  size: 50.sp,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "This is a study app. You can learn from giving quizes and you can use it as you want and if you understand how this works, you would be able to scale it .",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: onSurfaceText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CircleButton(
                  width: 60.sp,
                  onTap: () {
                    Get.offNamed('/home');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 25.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
