import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

AppBar customAppBar({required String title}){
  return AppBar(
    title: Text(title, style: AppStyles.style20Bold.copyWith(color: ThemeColors.white),),
    centerTitle: true,
  );
}
