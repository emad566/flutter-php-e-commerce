import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/functions/alert_exit_app.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/widgets/custom_bottom_navigation_bar2.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/widgets/custom_float_action2.dart';
import 'package:get/get.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => alertExitApp(),
      child: GetBuilder<HomeLayoutControllerImp>(
        init: HomeLayoutControllerImp(),
        builder: (controller){
          return Scaffold(
            extendBody: true,
            backgroundColor: const Color(0XFFEEeeEE),
            bottomNavigationBar: CustomBottomNavigationBar2(controller: controller),
            floatingActionButton: CustomFloatAction2(controller: controller),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: controller.currentScreen.screen,
          );
        },
      ),
    );
  }
}





