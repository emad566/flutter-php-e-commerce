// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String selectedNotificationPayload = '';

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  initializeNotification() async {
    _configureSelectNotificationSubject();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          Get.dialog(Text(body!));
        },
      ),
      android: const AndroidInitializationSettings('ic_stat_icon_marvel'),
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (payload != null) {}
      selectNotificationSubject.add(payload!);
    });
  }

  displayNotification(
      {required String title,
      required String body,
      required Map<String, dynamic> data}) async {
    print(title);
    print(body);

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');

    DarwinNotificationDetails iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: '${data['notifiable_id']}|${data['title']}',
    );
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      // await Get.to(() => VisitView(
      //       client_name: payload.split('|')[1],
      //       visitId: int.parse(payload.split('|')[0]),
      //     ));
    });
  }

  Future<void> cancelNotification({required dynamic id}) async {
    await flutterLocalNotificationsPlugin.cancel(id!);
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
