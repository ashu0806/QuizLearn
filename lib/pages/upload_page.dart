import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questionPapersData/data_upload_controller.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';

class UploadPage extends StatelessWidget {
  UploadPage({super.key});
  final uploadController = Get.put(DataUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
              uploadController.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading Completed"
                  : "Uploading",
            )),
      ),
    );
  }
}
