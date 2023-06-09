import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/change_lang_controller.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData get lightThem => ThemeData(
        useMaterial3: false,
        textTheme: ChangeLangController().langStr == 'ar'
            ? GoogleFonts.cairoTextTheme(_lightTextTheme)
            : GoogleFonts.playfairDisplayTextTheme(_lightTextTheme),
      );

  static ThemeData get darkThem => ThemeData(
        useMaterial3: false,
        textTheme: ChangeLangController().langStr == 'ar'
            ? GoogleFonts.cairoTextTheme(_darkTextTheme)
            : GoogleFonts.playfairDisplayTextTheme(_darkTextTheme),
      );

  static final TextTheme _darkTextTheme = TextTheme(
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
  );

  static final TextTheme _lightTextTheme = TextTheme(
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
  );
}
