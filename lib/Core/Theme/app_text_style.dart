import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum _FontWeight {
  bold(FontWeight.w700), // 700 bold
  semiBold(FontWeight.w600); // 600 semibold

  const _FontWeight(this.value);
  final FontWeight value;
}

class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._init();
  static AppTextStyle get instance => _instance;
  AppTextStyle._init();

  final TextStyle largeTitle = TextStyle(fontFamily: 'Poppins', fontSize: 45.sp, fontWeight: _FontWeight.bold.value);
  final TextStyle title1 = TextStyle(fontFamily: 'Poppins', fontSize: 37.sp, fontWeight: _FontWeight.bold.value);
  final TextStyle title2 = TextStyle(fontFamily: 'Poppins', fontSize: 27.sp, fontWeight: _FontWeight.semiBold.value);
  final TextStyle title3 = TextStyle(fontFamily: 'Poppins', fontSize: 26.sp, fontWeight: _FontWeight.semiBold.value);
  final TextStyle headLine = TextStyle(fontFamily: 'Poppins', fontSize: 23.sp, fontWeight: _FontWeight.semiBold.value);
  final TextStyle body = TextStyle(fontFamily: 'Poppins', fontSize: 22.sp);
  final TextStyle callOut = TextStyle(fontFamily: 'Poppins', fontSize: 21.sp);
  final TextStyle subHead = TextStyle(fontFamily: 'Poppins', fontSize: 20.sp);
  final TextStyle footNote = TextStyle(fontFamily: 'Poppins', fontSize: 17.sp);
  final TextStyle caption1 = TextStyle(fontFamily: 'Poppins', fontSize: 12.sp);
  final TextStyle caption2 = TextStyle(fontFamily: 'Poppins', fontSize: 14.sp);
}
