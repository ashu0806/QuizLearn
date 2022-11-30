import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';
import 'package:quiz_learn/models/question_paper_model.dart';

class DataUploadController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    uploadData();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus(LoadingStatus.loading);

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMapData = json.decode(manifestContent);

    final papers = manifestMapData.keys
        .where(
          (path) =>
              path.startsWith('assets/DB/papers') && path.contains('.json'),
        )
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papers) {
      String paperContent = await rootBundle.loadString(paper);
      questionPapers.add(
        QuestionPaperModel.fromJson(
          json.decode(paperContent),
        ),
      );
    }

    var batch = firebaseFirestore.batch();

    for (var paper in questionPapers) {
      batch.set(
        questionPapersReference.doc(paper.id),
        {
          'title': paper.title,
          'image_url': paper.imageUrl,
          'description': paper.description,
          'time_seconds': paper.timeSeconds,
          'question_count':
              paper.questions == null ? 0 : paper.questions!.length,
        },
      );

      for (var questions in paper.questions!) {
        final questionPath = questionsReference(
          paperId: paper.id,
          questionId: questions.id,
        );
        batch.set(
          questionPath,
          {
            'question': questions.question,
            'correct_answer': questions.correctAnswer,
          },
        );
        for (var answers in questions.answers) {
          batch.set(
            questionPath.collection('answers').doc(answers.identifier),
            {
              'identifier': answers.identifier,
              'answer': answers.answer,
            },
          );
        }
      }
    }
    await batch.commit();

    loadingStatus(LoadingStatus.completed);

    // log('Length ${questions[0]}');
    log('uploadData');
  }
}
