import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.amber.shade400,
        backgroundColor: AppColors.buttonColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
  );
}
