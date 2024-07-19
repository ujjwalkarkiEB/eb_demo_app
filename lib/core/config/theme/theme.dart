import 'package:eb_demo_app/core/config/theme/custom_theme/text_field_theme.dart';
import 'package:flutter/material.dart';

import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightThemeData = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme

      // appBarTheme: EAppBarTheme.lightAppBarTheme,
      // chipTheme: AppChipTheme.lightChipTheme,
      );
  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    // appBarTheme: EAppBarTheme.darkAppBarTheme,
    // chipTheme: AppChipTheme.darkChipTheme,
  );
}
