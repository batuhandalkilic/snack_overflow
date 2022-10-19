import 'package:flutter/material.dart';

class AppColorStyle {
  static final AppColorStyle _instance = AppColorStyle._init();
  static AppColorStyle get instance => _instance;
  AppColorStyle._init();

  Color get cornflowerBlue => const Color.fromRGBO(65, 155, 249, 1);
  Color get facebookBlue => const Color.fromRGBO(24, 119, 242, 1);
  Color get green => const Color.fromRGBO(200, 207, 45, 1);
  Color get peachPressed => const Color.fromRGBO(238, 103, 35, 1);
  Color get peach => const Color.fromRGBO(238, 103, 35, 1);
  Color get orange => const Color.fromRGBO(246, 152, 51, 1);
  Color get yellow => const Color.fromRGBO(254, 207, 51, 1);
  Color get teflon => const Color.fromRGBO(85, 77, 86, 1);
  Color get gandalf => const Color.fromRGBO(151, 145, 151, 1);
  Color get clooney => const Color.fromRGBO(193, 190, 193, 1);
  Color get karlPressed => const Color.fromRGBO(237, 236, 237, 1);
  Color get karl => const Color.fromRGBO(237, 236, 237, 1);
  Color get whitey => const Color.fromRGBO(247, 247, 247, 1);
  Color get snowman => const Color.fromRGBO(251, 251, 251, 1);
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get black => const Color.fromRGBO(0, 0, 0, 1);
}
