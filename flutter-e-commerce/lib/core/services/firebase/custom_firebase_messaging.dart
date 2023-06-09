import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_e_commerce/core/services/firebase/notify_helper.dart';
import 'package:flutter_e_commerce/core/services/service_locator.dart';

class CustomFirebaseMessaging {
  Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else {}
  }

  void listenToFirebaseMessaging() async {
    await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title} | ${message.notification!.body}');

        getIt<NotifyHelper>().displayNotification(
            title: message.notification!.title!,
            body: message.notification!.body!,
            data: message.data);
      }
    });
  }
}
