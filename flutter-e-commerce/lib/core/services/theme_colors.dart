import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_colors.dart';
import 'package:get/get.dart';

abstract class ThemeColors {
  // Theme Generic Colors
  static Color get white => Get.isDarkMode ? AppColors.white : AppColors.white;
  static Color get black => Get.isDarkMode ? AppColors.black : AppColors.black;

  //ThemeColors
  static Color get primaryText =>
      Get.isDarkMode ? AppColors.darkPrimaryText : AppColors.primaryText;
  static Color get secondaryText =>
      Get.isDarkMode ? AppColors.darkSecondaryText : AppColors.secondaryText;
  static Color get tripleText =>
      Get.isDarkMode ? AppColors.darkTripleText : AppColors.tripleText;
  static Color get primaryBg =>
      Get.isDarkMode ? AppColors.darkPrimaryBg : AppColors.primaryBg;

  static Color get primaryClr =>
      Get.isDarkMode ? AppColors.darkPrimaryClr : AppColors.primaryClr;
  static Color get secondClr =>
      Get.isDarkMode ? AppColors.darkSecondClr : AppColors.secondClr;
  static Color get fourthClr =>
      Get.isDarkMode ? AppColors.darkFourthClr : AppColors.fourthClr;
  static Color get thirdClr =>
      Get.isDarkMode ? AppColors.darkThirdClr : AppColors.thirdClr;
}
