import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

import 'Core/Theme/app_theme.dart';
import 'View/MarketPlace/markat_place.dart';
import 'View/authentication/onboarding/view/onboradin_view.dart';
import 'View/product/constants/product_text.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 0, 0, 0), // status bar color
  ));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: const MarkatPlace(),
      designSize: const Size(412, 914),
      builder: (BuildContext context, child) {
        const backgroundImage = 'welcome-main'; // png
        // Uygulama açılır açılmaz yüklensin!
        //sayfa geçişinde 1 saniye geç geldiği için yapıldı!
        preCacheImageWelcomeMainPageBackground(backgroundImage, context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance.lightTheme,
          title: ProductText.instance.appTitle,
          home: child,
        );
      },
    );
  }

  Future<void> preCacheImageWelcomeMainPageBackground(String backgroundImage, BuildContext context) {
    return precacheImage(
        AssetImage(
          backgroundImage.toJpg,
        ),
        context);
  }
}
