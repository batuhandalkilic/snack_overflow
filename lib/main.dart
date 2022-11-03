import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/Base/models/base_model_user.dart';
import 'Core/cache/hive.dart';
import 'Core/extension/string_extension.dart';

import 'Core/Theme/app_theme.dart';

import 'View/authentication/onboarding/view/onboradin_view.dart';
import 'View/authentication/welcome pages/sign up page/view/sign_up_page.dart';

import 'View/product/constants/product_text.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 0, 0, 0), // status bar color
  ));

  final container = ProviderContainer();
  await container.read(cacheProvider).initHive("stackflow");
  await container.read(cacheProvider).hiveOpenBox("userBox");
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool? isUserLoad = false;

  @override
  void initState() {
    isUserLoad = isUserLogin();
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
      child: isUserLoad == true ? const SignUpPage() : const OnboradinView(),
    );
  }

  Future<void> preCacheImageWelcomeMainPageBackground(String backgroundImage, BuildContext context) {
    return precacheImage(
        AssetImage(
          backgroundImage.toJpg,
        ),
        context);
  }

// Daha önce üye olduysa onboarding gözükmeyecek
  bool? isUserLogin() {
    List<String>? usersIdList = ref.read(cacheProvider).getKeys();
    List<User>? userList = ref.read(cacheProvider).getValues();
    bool? isUserLogingBool;
    for (var id in usersIdList!) {
      for (var user in userList!) {
        if (user.id == id) {
          isUserLogingBool = true;
        }
      }
    }
    return isUserLogingBool;
  }
}
