import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/app_routes.dart';
import 'package:flutter_e_commerce/core/localization/app_translation.dart';
import 'package:flutter_e_commerce/core/localization/change_lang_controller.dart';
import 'package:flutter_e_commerce/core/services/app_services.dart';
import 'package:flutter_e_commerce/core/services/app_themes.dart';
import 'package:flutter_e_commerce/core/services/theme_services.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.initialServices();
  await GetStorage.init();

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
      home: LoginScreen(),
      routes: AppRoutes.routes,
    );
  }
}
