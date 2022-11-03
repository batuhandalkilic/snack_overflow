import 'package:flutter/material.dart';

import 'app_color_style.dart';
import 'app_text_style.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;
  AppTheme._init();

  ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: AppTextStyle.instance.headLine.copyWith(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: AppColorStyle.instance.white,
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
  );
}
