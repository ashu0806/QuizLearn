import 'package:get/get.dart';
import 'package:quiz_learn/controllers/auth/auth_controller.dart';
import 'package:quiz_learn/controllers/theme_controller.dart';
import 'package:quiz_learn/services/firebase_storage_services.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ThemeController(),
    );
    Get.put(
      AuthController(),
      permanent: true,
    );
    Get.put(
      FirebaseStorageServices(),
    );
  }
}
