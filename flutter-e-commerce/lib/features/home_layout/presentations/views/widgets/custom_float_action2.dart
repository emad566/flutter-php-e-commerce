import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';

class CustomFloatAction2 extends StatelessWidget {
  const CustomFloatAction2({
    super.key,
    required this.controller,
  });
  final HomeLayoutController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: controller.currentIndex == 2? ThemeColors.primaryClr : Colors.blueAccent,
      onPressed: () {
        controller.updateIndex(2);
      },
      child: const Icon(Icons.shopping_basket_outlined),
    );
  }
}
