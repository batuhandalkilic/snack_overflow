import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/components/button/custom_button.dart';
import 'package:snack_overflow/Core/components/diveder/custom_diveder.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/validator/mail_validator.dart';
import 'package:snack_overflow/View/authentication/welcome%20pages/sign%20up%20page/model/user_model.dart';
import 'package:snack_overflow/View/product/constants/product_text.dart';
import '../../../../../Core/extension/string_extension.dart';
import '../sign_up_page_viewmodel/sign_up_page_viewmodel.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends SignUpPageViewmodel {
  final String iSignUpWitEmail = 'IsignUpWithPage';
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: context.horizantalPaddingMedium,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(iSignUpWitEmail.toIconPng),
                  context.sizedBoxHeightBoxLow4x,
                  Text(
                    ProductText.instance.goWithYourFlow,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  context.sizedBoxHeightBoxLow4x,
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: context.buttonRadius, //
                              color: AppColorStyle.instance.whitey, //
                            ),
                            child: TextFormField(
                              onSaved: (newValue) => email = newValue, //
                              autovalidateMode: AutovalidateMode.onUserInteraction, //
                              toolbarOptions: const ToolbarOptions(paste: true),
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColorStyle.instance.teflon),
                              autocorrect: true,
                              maxLines: 1,
                              autofocus: true,
                              textInputAction: TextInputAction.next, //
                              keyboardType: TextInputType.emailAddress, //
                              validator: (value) {
                                return Validator.instance.validateEmail(value); //
                              },
                              decoration: InputDecoration(
                                  errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red),
                                  border: InputBorder.none,
                                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColorStyle.instance.clooney),
                                  hintText: 'simit.donuts@gmail.com', //
                                  prefixIcon: Image.asset(
                                    //
                                    'iMail'.toIconPng,
                                  )),
                            ),
                          ),
                          context.sizedBoxHeightBoxLow4x,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: context.buttonRadius,
                              color: AppColorStyle.instance.whitey,
                            ),
                            child: TextFormField(
                                onSaved: (newValue) => password = newValue,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColorStyle.instance.teflon),
                                obscuringCharacter: '*', //
                                obscureText: ref.watch(isVisibilityChangeProvider), //
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => Validator.instance.validatePassword(value),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red),
                                    hintText: "Şifre",
                                    border: InputBorder.none,
                                    suffixIconColor: AppColorStyle.instance.green,
                                    suffixIcon: IconButton(
                                        focusColor: AppColorStyle.instance.green,
                                        onPressed: (() {
                                          ref.read(isVisibilityChangeProvider.state).update((state) => !state);
                                        }),
                                        icon: AnimatedCrossFade(
                                            firstChild: Icon(
                                              color: AppColorStyle.instance.clooney,
                                              Icons.visibility_off_outlined,
                                            ),
                                            secondChild: Icon(
                                              Icons.visibility_outlined,
                                              color: AppColorStyle.instance.clooney,
                                            ),
                                            crossFadeState:
                                                ref.watch(isVisibilityChangeProvider) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                            duration: const Duration(seconds: 1))),
                                    prefixIcon: Image.asset('iPassword'.toIconPng))),
                          ),
                          context.sizedBoxHeightBoxLow4x,
                          const CustomDiveder(),
                          context.sizedBoxHeightBoxLow4x,
                          CustomPrimaryButton(
                              description: "Create account",
                              onPressed: (() {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  UserModel newUser = UserModel(email: email!, password: password!);
                                  print(newUser);
                                  print(newUser.email);
                                  print(newUser.password);
                                }
                              }))
                        ],
                      )),
                  context.sizedBoxHeightBoxLow4x,
                  Text(
                    softWrap: true,
                    textAlign: TextAlign.left,
                    "By clicking Create account, I agree to SnackOverflow’s TOS and Privacy Policy.",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
