import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:firebase_practice/pages/dashboard_page.dart';
import 'package:firebase_practice/pages/menus/home_page.dart';
import 'package:firebase_practice/routes/myAppRoute.dart';
import 'package:get/get.dart';

final authController = Get.find<AuthController>();

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Background Message: ${message.notification?.body ?? ''}');
  print('Notification Title: ${message.notification?.title ?? ''}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> iniNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Firebase Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Handle messages when the app is in foreground
    FirebaseMessaging.onMessage.listen((message) {
      print('Foreground Message: ${message.notification?.body ?? ''}');
      print('Payload: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Notification Opened: ${message.notification?.body ?? ''}');
      print('Payload: ${message.data}');
      Get.to(() => MyAppsRoute.navbar);

      final userProfile = authController.userProfile.value;
      if (userProfile == null) 
      {
        Get.to(() => MyAppsRoute.login);
      }
    });
  }
}
