import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/widgets/background_decoration.dart';
import 'package:quiz_learn/core/widgets/content_area.dart';
import 'package:quiz_learn/core/widgets/custom_app_bar.dart';
import 'package:quiz_learn/core/widgets/questions/answer_card.dart';
import 'package:quiz_learn/pages/question/result_page.dart';

class CheckAnswerPage extends GetView<QuestionsController> {
  const CheckAnswerPage({super.key});
  static const String routeName = '/checkAnswer';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          titleWidget: Obx(
            () => Text(
              'Q.${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
              style: headerText,
            ),
          ),
          showActionIcon: true,
          onMenuActionTap: () {
            Get.toNamed(
              ResultPage.routeName,
            );
          },
        ),
        body: BackgroundDecoration(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          GetBuilder<QuestionsController>(
                            id: 'answer_review_list',
                            builder: (controller) {
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;

                                  final answerText =
                                      '${answer.identifier}. ${answer.answer}';
                                  if (correctAnswer == selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return CorrectAnswer(
                                      answer: answerText,
                                    );
                                  } else if (selectedAnswer == null) {
                                    return NotAnswered(
                                      answer: answerText,
                                    );
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return WrongAnswer(
                                      answer: answerText,
                                    );
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    return CorrectAnswer(
                                      answer: answerText,
                                    );
                                  }

                                  return AnswerCard(
                                    answer: answerText,
                                    onTap: () {},
                                    isSelected: false,
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers.length,
                              );
                            },
                          ),
                        ],
                      ),
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
