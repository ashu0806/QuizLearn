import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    super.key,
    this.color,
    required this.time,
  });

  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          time,
          style: countDounTimerStyle().copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
