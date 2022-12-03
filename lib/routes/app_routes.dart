import 'package:get/get.dart';
import 'package:quiz_learn/controllers/my_drawer_controller.dart';
import 'package:quiz_learn/controllers/question_paper_controller.dart';
import 'package:quiz_learn/controllers/questions_controller.dart';
import 'package:quiz_learn/pages/home/home_page.dart';
import 'package:quiz_learn/pages/login/login_page.dart';
import 'package:quiz_learn/pages/onboarding/onboarding_page.dart';
import 'package:quiz_learn/pages/question/check_answer_page.dart';
import 'package:quiz_learn/pages/question/question_page.dart';
import 'package:quiz_learn/pages/question/result_page.dart';
import 'package:quiz_learn/pages/question/test_overview_page.dart';
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
              Get.put(
                MyDrawerController(),
              );
            },
          ),
        ),
        GetPage(
          name: LogInPage.routeName,
          page: () => const LogInPage(),
        ),
        GetPage(
          name: HomePage.routeName,
          page: () => const HomePage(),
        ),
        GetPage(
          name: QuestionPage.routeName,
          page: () => const QuestionPage(),
          binding: BindingsBuilder(
            () {
              Get.put<QuestionsController>(
                QuestionsController(),
              );
            },
          ),
        ),
        GetPage(
          name: TestOverViewPage.routeName,
          page: () => const TestOverViewPage(),
        ),
        GetPage(
          name: ResultPage.routeName,
          page: () => const ResultPage(),
        ),
        GetPage(
          name: CheckAnswerPage.routeName,
          page: () => const CheckAnswerPage(),
        ),
      ];
}
