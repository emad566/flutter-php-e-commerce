import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/app_routes.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/on_boarding_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: AppRoutes.routes,
    );
  }
}
