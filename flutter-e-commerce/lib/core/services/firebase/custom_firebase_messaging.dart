import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/core/functions/display_in_app_notification.dart';

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
      if (kDebugMode) {
        print('Message data: ${message.data}');
      }

      if (message.notification != null) {
        if (kDebugMode) {
          print('Message also contained a notification: ${message.notification!.title} | ${message.notification!.body}');
        }

        displayInAppNotification(
            title: message.notification!.title!,
            body: message.notification!.body!,
            data: message.data
        );

        // getIt<NotifyHelper>().displayNotification(
        //     title: message.notification!.title!,
        //     body: message.notification!.body!,
        //     data: message.data
        // );
      }
    });
  }
}
