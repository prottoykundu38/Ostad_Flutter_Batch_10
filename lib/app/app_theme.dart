import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData =>
      ThemeData(colorSchemeSeed: AppColors.themeColor,scaffoldBackgroundColor: Colors.white);
  static ThemeData get darkThemeData => ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        // brightness: Brightness.dark,
      );
}
