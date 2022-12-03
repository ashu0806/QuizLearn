import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/utils/ui_parameters.dart';
import 'package:quiz_learn/core/widgets/background_decoration.dart';
import 'package:quiz_learn/core/widgets/content_area.dart';
import 'package:quiz_learn/core/widgets/custom_app_bar.dart';
import 'package:quiz_learn/core/widgets/questions/answer_card.dart';
import 'package:quiz_learn/core/widgets/questions/countdown_timer.dart';
import 'package:quiz_learn/core/widgets/questions/question_number_card.dart';

class TestOverViewPage extends GetView<QuestionsController> {
  const TestOverViewPage({super.key});

  static const String routeName = '/testOverview';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: controller.completedTest,
        ),
        body: BackgroundDecoration(
          child: Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CountDownTimer(
                            time: '',
                            color: UiParameters.isDarkMode()
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor,
                          ),
                          Obx(
                            () => Text(
                              '${controller.time} remaining',
                              style: countDounTimerStyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                          ),
                          itemBuilder: (context, index) {
                            AnswerStatus? answerStatus;
                            if (controller.allQuestions[index].selectedAnswer !=
                                null) {
                              answerStatus = AnswerStatus.answered;
                            }
                            return QuestionNumberCard(
                              index: index + 1,
                              answerStatus: answerStatus,
                              onTap: () => controller.jumpToQuestion(index),
                            );
                          },
                          itemCount: controller.allQuestions.length,
                        ),
                      ),
                      ColoredBox(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Padding(
                          padding: EdgeInsets.all(
                            18.sm,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.complete();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Completed",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? onSurfaceText
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
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
