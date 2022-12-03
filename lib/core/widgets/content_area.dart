import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({
    super.key,
    this.addPadding = true,
    required this.child,
  });
  final bool addPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          20.r,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        padding: addPadding
            ? EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              )
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
