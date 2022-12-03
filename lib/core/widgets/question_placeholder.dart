import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class QuestionPlaceholder extends StatelessWidget {
  const QuestionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12.h,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    var answer = Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
    );
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
        children: [
          EasySeparatedColumn(
            children: [
              line,
              line,
              line,
            ],
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.h,
              );
            },
          ),
          answer,
          answer,
          answer,
          answer,
        ],
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.h,
          );
        },
      ),
    );
  }
}
