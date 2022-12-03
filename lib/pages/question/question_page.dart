import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/widgets/background_decoration.dart';
import 'package:quiz_learn/core/widgets/content_area.dart';
import 'package:quiz_learn/core/widgets/custom_app_bar.dart';
import 'package:quiz_learn/core/widgets/question_placeholder.dart';
import 'package:quiz_learn/core/widgets/questions/answer_card.dart';
import 'package:quiz_learn/core/widgets/questions/countdown_timer.dart';
import 'package:quiz_learn/pages/question/test_overview_page.dart';

class QuestionPage extends GetView<QuestionsController> {
  const QuestionPage({super.key});
  static const String routeName = '/questionScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            decoration: ShapeDecoration(
              shape: StadiumBorder(
                side: BorderSide(
                  color: onSurfaceText,
                  width: 2.w,
                ),
              ),
            ),
            child: Obx(
              () => CountDownTimer(
                time: controller.time.value,
                color: onSurfaceText,
              ),
            ),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              "Q.${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
              style: headerText,
            ),
          ),
        ),
        body: BackgroundDecoration(
          child: Obx(
            () => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(
                    child: ContentArea(
                      child: QuestionPlaceholder(),
                    ),
                  ),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ContentArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5.w,
                          right: 5.w,
                          top: 10.h,
                          bottom: 50.h,
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
                            GetBuilder<QuestionsController>(
                              id: 'answers_list',
                              builder: (controller) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(
                                    top: 20.h,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answer:
                                          '${answer.identifier}. ${answer.answer}',
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifier);
                                      },
                                      isSelected: answer.identifier ==
                                          controller.currentQuestion.value!
                                              .selectedAnswer,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 10.h,
                                    );
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length,
                                );
                              },
                            ),
                            const Spacer(),
                            ColoredBox(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: EdgeInsets.all(
                                  15.sm,
                                ),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: controller.isFirstQuestion,
                                      child: InkWell(
                                        onTap: () {
                                          controller.prevQuestion();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Get.isDarkMode
                                                ? onSurfaceText
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Expanded(
                                      child: Visibility(
                                        visible:
                                            controller.loadingStatus.value ==
                                                LoadingStatus.completed,
                                        child: InkWell(
                                          onTap: () {
                                            controller.isLastQuestion
                                                ? Get.toNamed(
                                                    TestOverViewPage.routeName,
                                                  )
                                                : controller.nextQuestion();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              controller.isLastQuestion
                                                  ? "Completed"
                                                  : "Next",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Get.isDarkMode
                                                    ? onSurfaceText
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
