import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';

abstract class AppThemes {
  static  ThemeData get lightThem => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.style26Bold,
      displayMedium: AppStyles.style24Bold,
      displaySmall: AppStyles.style24,

      headlineLarge: AppStyles.style22Bold,
      headlineMedium: AppStyles.style22,
      headlineSmall: AppStyles.style20,

      titleLarge: AppStyles.style18Bold,
      titleMedium: AppStyles.style16Bold,
      titleSmall: AppStyles.style16,

      bodyLarge: AppStyles.style14Bold,
      bodyMedium: AppStyles.style14,
      bodySmall: AppStyles.style12,
    ),
  );

  static  ThemeData get darkThem => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.style26Bold,
      displayMedium: AppStyles.style24Bold,
      displaySmall: AppStyles.style24,

      headlineLarge: AppStyles.style22Bold,
      headlineMedium: AppStyles.style22,
      headlineSmall: AppStyles.style20,

      titleLarge: AppStyles.style18Bold,
      titleMedium: AppStyles.style16Bold,
      titleSmall: AppStyles.style16,

      bodyLarge: AppStyles.style14Bold,
      bodyMedium: AppStyles.style14,
      bodySmall: AppStyles.style12,
    ),
  );
}
