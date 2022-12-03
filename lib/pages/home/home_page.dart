import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/my_drawer_controller.dart';
import 'package:quiz_learn/controllers/question_paper_controller.dart';
import 'package:quiz_learn/core/utils/app_colors.dart';
import 'package:quiz_learn/core/utils/app_icons.dart';
import 'package:quiz_learn/core/utils/custom_text_style.dart';
import 'package:quiz_learn/core/widgets/content_area.dart';
import 'package:quiz_learn/pages/home/menu_page.dart';
import 'package:quiz_learn/pages/home/question_card.dart';

class HomePage extends GetView<MyDrawerController> {
  const HomePage({super.key});

  static const String routeName = '/home';

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) {
//         log("FirebaseMessaging.instance.getInitialMessage");
//         if (message != null) {
//           log("New Notification");
//         }
//       },
//     );
//     FirebaseMessaging.onMessage.listen(
//       (message) {
//         log("FirebaseMessaging.onMessage.listen");
//         if (message.notification != null) {
//           log(message.notification!.title.toString());
//           log(message.notification!.body.toString());
//           log("message.data11 ${message.data}");
//           LocalNotificationService.showNotification(message);
//         }
//       },
//     );
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (message) {
//         log("FirebaseMessaging.onMessageOpenedApp.listen");
//         if (message.notification != null) {
//           log(message.notification!.title.toString());
//           log(message.notification!.body.toString());
//           log("message.data22 ${message.data['_id']}");
//         }
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<MyDrawerController>(
          builder: (_) {
            return ZoomDrawer(
              controller: _.zoomDrawerController,
              angle: 0.0,
              borderRadius: 40.r,
              menuScreen: const MenuPage(),
              style: DrawerStyle.defaultStyle,
              drawerShadowsBackgroundColor: Colors.white.withOpacity(0.5),
              menuBackgroundColor:
                  const Color.fromARGB(255, 94, 157, 203).withOpacity(0.5),
              menuScreenWidth: 1.sw,
              slideWidth: MediaQuery.of(context).size.width * 0.6,
              mainScreen: Container(
                decoration: BoxDecoration(
                  gradient: mainGradient(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        30.sm,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: controller.toggleDrawer,
                            child: Icon(
                              AppIcons.menu,
                              size: 22.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  AppIcons.peace,
                                ),
                                Text(
                                  "Hello friend",
                                  style: detailText.copyWith(
                                    color: onSurfaceText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'What do you want to learn today?',
                            style: headerText,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                        ),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              padding: EdgeInsets.all(
                                15.sm,
                              ),
                              itemBuilder: (context, index) {
                                return QuestionCard(
                                  model:
                                      questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                              itemCount:
                                  questionPaperController.allPapers.length,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
