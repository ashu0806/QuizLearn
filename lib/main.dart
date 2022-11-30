import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_learn/bindings/initial_bindings.dart';
import 'package:quiz_learn/controllers/theme_controller.dart';
import 'package:quiz_learn/notificationService/local_notification_service.dart';
import 'package:quiz_learn/routes/app_routes.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log(message.data.toString());
  log(message.notification!.title.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  InitialBindings().dependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Quiz Learn',
          debugShowCheckedModeBanner: false,
          theme: Get.find<ThemeController>().lightTheme,
          getPages: AppRoutes.routes(),
        );
      },
    );
  }
}
