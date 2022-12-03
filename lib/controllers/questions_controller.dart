import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/question_paper_controller.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';
import 'package:quiz_learn/models/question_paper_model.dart';
import 'package:quiz_learn/pages/home/home_page.dart';
import 'package:quiz_learn/pages/question/result_page.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Question>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;

  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  Rxn<Question> currentQuestion = Rxn<Question>();

  Timer? timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel;
    log(questionPaper.title);
    loadData(questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel model) async {
    questionPaperModel = model;
    loadingStatus(LoadingStatus.loading);
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await questionPapersReference
              .doc(model.id)
              .collection('questions')
              .get();
      final questions = querySnapshot.docs
          .map(
            (e) => Question.fromSnapshot(e),
          )
          .toList();
      model.questions = questions;

      for (var question in model.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPapersReference
                .doc(model.id)
                .collection('questions')
                .doc(question.id)
                .collection('answers')
                .get();

        final answers = answersQuery.docs
            .map(
              (e) => Answer.fromSnapshot(e),
            )
            .toList();

        question.answers = answers;
      }
    } catch (e) {
      log(e.toString());
    }
    if (model.questions != null && model.questions!.isNotEmpty) {
      allQuestions.assignAll(model.questions!);
      currentQuestion.value = model.questions![0];

      startTimer(model.timeSeconds);
      loadingStatus(LoadingStatus.completed);
    } else {
      loadingStatus(LoadingStatus.error);
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list', 'answer_review_list']);
  }

  String get completedTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return "$answered out of ${allQuestions.length} answered";
  }

  void jumpToQuestion(
    int index, {
    bool isGoBack = true,
  }) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoBack) {
      Get.back();
    }
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) {
      return;
    }
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) {
      return;
    }
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(
      duration,
      (timer) {
        if (remainingSeconds == 0) {
          timer.cancel();
        } else {
          int minutes = remainingSeconds ~/ 60;
          int seconds = remainingSeconds % 60;
          time.value =
              "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";

          remainingSeconds--;
        }
      },
    );
  }

  void complete() {
    timer!.cancel();
    Get.toNamed(
      ResultPage.routeName,
    );
  }

  void tryAgain() {
    Get.find<QuestionPaperController>().navigateToQuestion(
      paperModel: questionPaperModel,
      tryAgain: true,
    );
  }

  void navigateToHomePage() {
    timer!.cancel();
    Get.offNamedUntil(
      HomePage.routeName,
      (route) => false,
    );
  }
}
