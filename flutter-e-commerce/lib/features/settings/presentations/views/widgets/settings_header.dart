import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: ThemeColors.primaryClr,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),

        Positioned(
          top: 85,
          left: Get.width/2-73,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ThemeColors.tripleText,
            ),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: ThemeColors.white,
              backgroundImage: const AssetImage(AppPaths.avatar),
            ),
          ),
        ),
      ],
    );
  }
}
