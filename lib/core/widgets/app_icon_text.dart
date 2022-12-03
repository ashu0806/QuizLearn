import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconText extends StatelessWidget {
  const AppIconText({
    super.key,
    required this.icon,
    required this.text,
  });
  final Icon icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 5.w,
        ),
        text,
      ],
    );
  }
}
