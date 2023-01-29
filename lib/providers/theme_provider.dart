import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_colors.dart';

class ThemeProvider {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "HindSiliguri",
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      shadowColor: AppColors.borderColor,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w600, color: AppColors.primaryColor),
        subtitle2: TextStyle(
            fontWeight: FontWeight.w400, color: AppColors.primaryColor),
      ));
}
