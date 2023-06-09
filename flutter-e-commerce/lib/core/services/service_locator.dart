import 'package:flutter_e_commerce/core/services/firebase/custom_firebase_messaging.dart';
import 'package:flutter_e_commerce/core/services/firebase/notify_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetItServiceLocator() {
  getIt.registerSingleton<CustomFirebaseMessaging>(CustomFirebaseMessaging());
  getIt.registerSingleton<NotifyHelper>(NotifyHelper());
}
