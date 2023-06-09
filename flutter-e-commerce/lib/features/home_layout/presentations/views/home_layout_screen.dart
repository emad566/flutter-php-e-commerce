import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/widgets/custom_float_action.dart';
import 'package:get/get.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeLayoutController controller = Get.put(HomeLayoutControllerImp());

    return GetBuilder<HomeLayoutController>(
      builder: (controller){
        return Scaffold(
          backgroundColor: const Color(0XFFdddddd),
          bottomNavigationBar: CustomBottomNavigationBar(controller: controller),
          floatingActionButton: const CustomFloatAction(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: controller.currentScreen.screen,
        );
      },
    );
  }
}





