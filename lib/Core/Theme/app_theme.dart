import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';

import 'app_text_style.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;
  AppTheme._init();

  ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.instance.largeTitle,
      titleLarge: AppTextStyle.instance.title1,
      titleMedium: AppTextStyle.instance.title2,
      titleSmall: AppTextStyle.instance.title3,
      headlineMedium: AppTextStyle.instance.headLine,
      bodyLarge: AppTextStyle.instance.body,
      bodyMedium: AppTextStyle.instance.callOut,
      bodySmall: AppTextStyle.instance.subHead,
      labelLarge: AppTextStyle.instance.footNote,
      labelMedium: AppTextStyle.instance.caption1,
      labelSmall: AppTextStyle.instance.caption2,
    ),
    primaryColor: AppColorStyle.instance.peach,
  );
}
