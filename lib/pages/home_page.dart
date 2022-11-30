import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/controllers/questionPapersData/question_paper_controller.dart';
import 'package:quiz_learn/notificationService/local_notification_service.dart';
import 'package:quiz_learn/services/firebase_storage_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        log("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          log("New Notification");
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        log("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          log(message.notification!.title.toString());
          log(message.notification!.body.toString());
          log("message.data11 ${message.data}");
          LocalNotificationService.showNotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        log("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          log(message.notification!.title.toString());
          log(message.notification!.body.toString());
          log("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    Get.put(
      FirebaseStorageServices(),
    );
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                child: SizedBox(
                  height: 150.h,
                  width: 1.sw,
                  child: FadeInImage(
                    image: NetworkImage(
                      questionPaperController.allPaperImages[index],
                    ),
                    placeholder: const AssetImage(
                      'assets/images/app_splash_logo.png',
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: questionPaperController.allPaperImages.length,
          ),
        ),
      ),
    );
  }
}
