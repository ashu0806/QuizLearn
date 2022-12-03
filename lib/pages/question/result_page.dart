// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/controllers/test_result_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/widgets/background_decoration.dart';
import 'package:quiz_learn/core/widgets/content_area.dart';
import 'package:quiz_learn/core/widgets/custom_app_bar.dart';
import 'package:quiz_learn/core/widgets/questions/answer_card.dart';
import 'package:quiz_learn/core/widgets/questions/question_number_card.dart';
import 'package:quiz_learn/pages/question/check_answer_page.dart';

class ResultPage extends GetView<QuestionsController> {
  const ResultPage({super.key});
  static const String routeName = '/result';
  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: SizedBox(
            height: 40.h,
          ),
          title: controller.correctAnswerQuestions,
        ),
        body: BackgroundDecoration(
          child: Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/bulb.svg',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Congratulations",
                        style: headerText.copyWith(
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "You get ${controller.points} points",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Tap below question numbers to view correct answers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 8.w,
                          ),
                          itemBuilder: (_, index) {
                            final question = controller.allQuestions[index];
                            AnswerStatus status = AnswerStatus.notAnswered;
                            final selectedAnswer = question.selectedAnswer;
                            final correctAnswer = question.correctAnswer;
                            if (selectedAnswer == correctAnswer) {
                              status = AnswerStatus.correct;
                            } else if (selectedAnswer == null) {
                              status = AnswerStatus.wrong;
                            } else {
                              status = AnswerStatus.wrong;
                            }
                            return QuestionNumberCard(
                              index: index + 1,
                              answerStatus: status,
                              onTap: () {
                                controller.jumpToQuestion(
                                  index,
                                  isGoBack: false,
                                );
                                Get.toNamed(
                                  CheckAnswerPage.routeName,
                                );
                              },
                            );
                          },
                          itemCount: controller.allQuestions.length,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.tryAgain();
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 1.sw,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  child: Text(
                                    "Try again",
                                    style: detailText.copyWith(
                                      fontSize: 15.sp,
                                      color: onSurfaceText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.saveTestResults();
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 1.sw,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  child: Text(
                                    "Go to home",
                                    style: detailText.copyWith(
                                      fontSize: 15.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
