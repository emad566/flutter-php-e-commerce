import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
  });
  final HomeLayoutController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: controller.bottomItems(),
      currentIndex: controller.currentIndex,
      onTap: (index) {
        controller.updateIndex(index);
      },
      unselectedItemColor: ThemeColors.black.withOpacity(0.5),
      selectedItemColor: ThemeColors.black,
      elevation: 20,
      unselectedLabelStyle: AppStyles.style10Bold,
      selectedLabelStyle: AppStyles.style12Bold,
    );
  }
}
