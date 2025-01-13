import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Background Message: ${message.notification?.body?? ''}');
  print('Notification Title: ${message.notification?.title?? ''}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> iniNotification()async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Firebase Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
  }
}