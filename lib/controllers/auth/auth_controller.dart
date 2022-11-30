import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    initAuth();
  }

  void initAuth() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    navigateToOnboarding();
  }

  void navigateToOnboarding() {
    Get.offAllNamed('/onboarding');
  }
}
