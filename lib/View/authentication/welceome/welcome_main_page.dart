import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/components/button/custom_button.dart';
import 'package:snack_overflow/Core/components/button/custom_icon_button.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

class WelcomeMainPage extends StatefulWidget {
  const WelcomeMainPage({Key? key}) : super(key: key);

  @override
  _WelcomeMainPageState createState() => _WelcomeMainPageState();
}

class _WelcomeMainPageState extends State<WelcomeMainPage> {
  final backgroundImage = 'welcome-main'; // jpg
  final appLogo = 'applogo'; // png
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: boxDecoration(),
          child: Padding(
            padding: context.horizantalPaddingMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  appLogo.toAppLogoPng,
                ),
                signInButtons(context),
                context.sizedBoxHeightBoxLow4x,
                Divider(
                  indent: MediaQuery.of(context).size.width / 6,
                  endIndent: MediaQuery.of(context).size.width / 6,
                  thickness: 1.7,
                  color: AppColorStyle.instance.gandalf,
                ),
                context.sizedBoxHeightBoxLow4x,
                CustomPrimaryButton(
                    customButtonColor: AppColorStyle.instance.whitey,
                    textColor: AppColorStyle.instance.peach,
                    description: 'Sign up with Email',
                    onPressed: (() {}))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column signInButtons(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryIconButton(
            textColor: AppColorStyle.instance.whitey,
            description: "Sign In with Facebook",
            onPressed: (() {}),
            customButtonColor: AppColorStyle.instance.facebookBlue,
            icon: const Icon(
              Icons.facebook,
              size: 32,
            )),
        context.sizedBoxHeightBoxLow3x,
        CustomPrimaryIconButton(
            textColor: AppColorStyle.instance.gandalf,
            description: "Sign In with Google",
            onPressed: (() {}),
            customButtonColor: AppColorStyle.instance.whitey,
            icon: Image.asset(
              'googleLogo'.toIconPng,
              width: 32,
            )),
        context.sizedBoxHeightBoxLow3x,
        CustomPrimaryIconButton(
            textColor: AppColorStyle.instance.clooney,
            description: "Sign In with Apple",
            onPressed: (() {}),
            customButtonColor: AppColorStyle.instance.black,
            icon: Icon(
              Icons.apple,
              size: 32,
              color: AppColorStyle.instance.clooney,
            )),
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.colorDodge),
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage(backgroundImage.toJpg)));
  }
}
