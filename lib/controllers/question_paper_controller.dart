import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/auth/auth_controller.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';
import 'package:quiz_learn/models/question_paper_model.dart';
import 'package:quiz_learn/pages/question/question_page.dart';
import 'package:quiz_learn/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    getAllPapers();
  }

  getAllPapers() async {
    // List<String> imgName = [
    //   "biology",
    //   "chemistry",
    //   "maths",
    //   "physics",
    // ];
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await questionPapersReference.get();
      final papersList = data.docs
          .map(
            (paper) => QuestionPaperModel.fromSnapshot(paper),
          )
          .toList();
      allPapers.assignAll(papersList);

      for (var paper in papersList) {
        final imgUrl = await Get.find<FirebaseStorageServices>().getImage(
          paper.title,
        );
        paper.imageUrl = imgUrl;
      }

      allPapers.assignAll(papersList);
    } catch (e) {
      log(e.toString());
    }
  }

  void navigateToQuestion({
    required QuestionPaperModel paperModel,
    bool tryAgain = false,
  }) {
    AuthController authController = Get.find();

    if (authController.isLogged()) {
      if (tryAgain) {
        Get.back();
        Get.toNamed(
          QuestionPage.routeName,
          arguments: paperModel,
          preventDuplicates: false,
        );
      } else {
        Get.toNamed(
          QuestionPage.routeName,
          arguments: paperModel,
        );
      }
    } else {
      authController.showLogInAlertDialogue();
    }
  }
}
