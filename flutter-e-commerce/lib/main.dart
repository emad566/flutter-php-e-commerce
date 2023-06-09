import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/app_routes.dart';
import 'package:flutter_e_commerce/core/bindings/initial_bindings.dart';
import 'package:flutter_e_commerce/core/localization/app_translation.dart';
import 'package:flutter_e_commerce/core/localization/change_lang_controller.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';
import 'package:flutter_e_commerce/core/services/app_services.dart';
import 'package:flutter_e_commerce/core/services/app_themes.dart';
import 'package:flutter_e_commerce/core/services/firebase/notify_helper.dart';
import 'package:flutter_e_commerce/core/services/service_locator.dart';
import 'package:flutter_e_commerce/core/services/theme_services.dart';
import 'package:flutter_e_commerce/firebase_options.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseMessaging.instance.getToken();
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  setupGetItServiceLocator();

  await AppServices.initialServices();
  ApiService().init();
  await GetStorage.init();
  await getIt<NotifyHelper>().initializeNotification();

  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeServices().theme;
    ChangeLangController controller = Get.put(ChangeLangController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      translations: AppTranslation(),
      locale: controller.lang,
      theme: AppThemes.lightThem,
      darkTheme: AppThemes.darkThem,
      themeMode: themeMode,
      initialBinding: InitialBindings(),
      getPages: appRoutes,
    );
  }
}