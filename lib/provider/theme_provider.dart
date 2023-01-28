import 'package:flutter/material.dart';
import 'package:todo_chal1/constant/app_colors.dart';

class ThemeProvider {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "HindSiliguri",
      primarySwatch: Colors.blue,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      shadowColor: AppColors.borderColor,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          headline3: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w500)));
}
