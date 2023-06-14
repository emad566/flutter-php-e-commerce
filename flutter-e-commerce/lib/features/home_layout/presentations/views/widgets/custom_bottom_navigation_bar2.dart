import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/home_layout/data/models/screen_model.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/widgets/custom_button_app_bar.dart';

class CustomBottomNavigationBar2 extends StatelessWidget {
  const CustomBottomNavigationBar2({
    super.key,
    required this.controller,
  });
  final HomeLayoutController controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),

      notchMargin: 10,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.screens.length,
            ((index) {

              if(index == 2) return const Spacer();
              ScreenModel screen = controller.screens[index];

              return  CustomButtonAppBar(
                textButton: screen.title,
                iconData: screen.icon,
                onPressed: () {
                  controller.updateIndex(index);
                },
                active: controller.currentIndex == index ? true : false,
              );
            }),
          ),
        ),
      ),
    );
  }
}

