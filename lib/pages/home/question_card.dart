import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/question_paper_controller.dart';
import 'package:quiz_learn/core/utils/app_icons.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/utils/ui_parameters.dart';
import 'package:quiz_learn/core/widgets/app_icon_text.dart';
import 'package:quiz_learn/models/question_paper_model.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({
    super.key,
    required this.model,
  });
  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.r,
        ),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestion(
            paperModel: model,
            tryAgain: false,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(
            10.sm,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: (context, url) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/app_splash_logo.png',
                                  height: 20.h,
                                  width: 50.w,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 8.h,
                            bottom: 12.h,
                          ),
                          child: Text(
                            model.description,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: UiParameters.isDarkMode()
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${model.questionCount} questions',
                                style: detailText.copyWith(
                                  color: UiParameters.isDarkMode()
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            AppIconText(
                              icon: Icon(
                                Icons.timer,
                                color: UiParameters.isDarkMode()
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                model.timeInMinutes(),
                                style: detailText.copyWith(
                                  color: UiParameters.isDarkMode()
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -8.h,
                right: -8.h,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          12.r,
                        ),
                        bottomRight: Radius.circular(
                          12.r,
                        ),
                      ),
                    ),
                    child: const Icon(
                      AppIcons.trophyOutLine,
                    ),
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
