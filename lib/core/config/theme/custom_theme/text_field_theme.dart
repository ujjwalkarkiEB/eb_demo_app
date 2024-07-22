import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.black.withOpacity(0.8),
    suffixIconColor: Colors.black.withOpacity(0.8),
    labelStyle: const TextStyle()
        .copyWith(fontSize: 16, color: Colors.black.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: 12, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.green),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: Colors.amber),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    labelStyle: const TextStyle()
        .copyWith(fontSize: 16, color: Colors.white.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: 12, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.green),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: Colors.amber),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );

  // static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  //   errorMaxLines: 2,
  //   prefixIconColor: EColors.darkGrey,
  //   suffixIconColor: EColors.darkGrey,
  //   // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
  //   labelStyle: const TextStyle()
  //       .copyWith(fontSize: AppSizes.fontSizeMd, color: EColors.white),
  //   hintStyle: const TextStyle()
  //       .copyWith(fontSize: AppSizes.fonAppSizesm, color: EColors.white),
  //   floatingLabelStyle:
  //       const TextStyle().copyWith(color: EColors.white.withOpacity(0.8)),
  //   border: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
  //   ),
  //   enabledBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: EColors.darkGrey),
  //   ),
  //   focusedBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: EColors.white),
  //   ),
  //   errorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: EColors.warning),
  //   ),
  //   focusedErrorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
  //     borderSide: const BorderSide(width: 2, color: EColors.warning),
  //   ),
  // );
}
