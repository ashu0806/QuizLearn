import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';

enum AnswerStatus {
  correct,
  wrong,
  answered,
  notAnswered,
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  });
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        10.r,
      ),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          border: Border.all(
            color: isSelected ? answerSelectedColor() : answerBorderColor(),
          ),
          color:
              isSelected ? answerSelectedColor() : Theme.of(context).cardColor,
        ),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceText : null,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: correctAnswerColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(
          color: correctAnswerColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: wrongAnswerColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(
          color: wrongAnswerColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  const NotAnswered({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: notAnsweredColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(
          color: notAnsweredColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
