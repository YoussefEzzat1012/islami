import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackBgColor,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: AppColors.primaryColor
        ),
      )
    //canvasColor: AppColors.primaryColor
  );
}
