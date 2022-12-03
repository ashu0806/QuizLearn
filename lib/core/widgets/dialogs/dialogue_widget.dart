import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget quizStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi..",
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
            ),
          ),
          Text(
            "Please login before you start",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
