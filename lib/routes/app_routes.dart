import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questionPapersData/question_paper_controller.dart';
import 'package:quiz_learn/pages/home_page.dart';
import 'package:quiz_learn/pages/onboarding/onboarding_page.dart';
import 'package:quiz_learn/pages/splash/splash_page.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
        ),
        GetPage(
          name: '/onboarding',
          page: () => const OnboardingPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: BindingsBuilder(
            () {
              Get.put(
                QuestionPaperController(),
              );
            },
          ),
        ),
      ];
}
