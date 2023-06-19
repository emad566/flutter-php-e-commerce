import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

void snackBar(String title, String message, {snackPosition= SnackPosition.BOTTOM}){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: ThemeColors.black.withOpacity(0.8),
    colorText: ThemeColors.white,
  );
}