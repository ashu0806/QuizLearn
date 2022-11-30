import 'dart:developer';

import 'package:get/get.dart';
import 'package:quiz_learn/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    super.onReady();
    getAllPapers();
  }

  getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];
    try {
      for (var image in imgName) {
        final imgUrl =
            await Get.find<FirebaseStorageServices>().getImage(image);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
