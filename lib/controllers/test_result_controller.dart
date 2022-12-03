import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/auth/auth_controller.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';

extension TestResultController on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnswerQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainingSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResults() async {
    var batch = firebaseFirestore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) {
      return;
    }
    batch.set(
      userRefrence
          .doc(user.email)
          .collection('recent_scores')
          .doc(questionPaperModel.id),
      {
        'points': points,
        'correct_answers': '$correctQuestionCount/${allQuestions.length}',
        'question_id': questionPaperModel.id,
        'time_taken': questionPaperModel.timeSeconds - remainingSeconds,
      },
    );
    batch.commit();
    navigateToHomePage();
  }
}
