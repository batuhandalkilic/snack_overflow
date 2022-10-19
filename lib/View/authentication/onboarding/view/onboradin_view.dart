import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/View/product/constants/product_text.dart';
import '../../../../Core/Theme/app_color_style.dart';
import '../../../../Core/components/button/custom_button.dart';
import '../../../../Core/extension/build_extension.dart';
import '../../welceome/welcome_main_page.dart';
import '../view_model/onboarding_view_model.dart';

class OnboradinView extends StatefulWidget {
  const OnboradinView({Key? key}) : super(key: key);

  @override
  _OnboradinViewState createState() => _OnboradinViewState();
}

class _OnboradinViewState extends OnboardingViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(flex: 8, child: onboardingPageViewBuilder()),
            Flexible(flex: 1, child: sliderObserve(context)),
            context.sizedBoxHeightBoxLow4x,
            Padding(
                padding: context.horizantalPaddingMedium,
                child: CustomPrimaryButton(
                  description: ProductText.instance.getStarted,
                  buttonHeight: 56.h,
                  customButtonColor: AppColorStyle.instance.peach,
                  onPressed: () {
                    // kullanıcı bir kere görecek basınca görüldü diye kaydetmeyi unutma
                    // shared ya da hive kullan
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          final tween = Tween(begin: begin, end: end);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: curve,
                          );
                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                        pageBuilder: ((context, animation, secondaryAnimation) => WelcomeMainPage())));
                  },
                )),
            context.sizedBoxHeightBoxLow4x,
          ],
        ),
      ),
    );
  }

  PageView onboardingPageViewBuilder() {
    return PageView.builder(
        onPageChanged: _onChange,
        itemCount: list.length,
        controller: pageController,
        itemBuilder: ((context, index) {
          return Column(
            children: <Widget>[
              Image.asset(
                list[index].path,
              ),
              context.sizedBoxHeightBoxLow4x,
              Padding(
                padding: context.horizantalPaddingMedium,
                child: Text(
                  textAlign: TextAlign.center,
                  list[index].description,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColorStyle.instance.peach),
                ),
              ),
            ],
          );
        }));
  }

  Row sliderObserve(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: currentPage == 0 ? 25.h : 12.h,
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentPage == 0 ? AppColorStyle.instance.clooney : AppColorStyle.instance.karl,
          ),
        ),
        context.sizedBoxWidthBoxLow2x,
        Container(
          width: currentPage == 1 ? 25.h : 12.h,
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentPage == 1 ? AppColorStyle.instance.clooney : AppColorStyle.instance.karl,
          ),
        ),
        context.sizedBoxWidthBoxLow2x,
        Container(
          width: currentPage == 2 ? 25.h : 12.h,
          height: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentPage == 2 ? AppColorStyle.instance.clooney : AppColorStyle.instance.karl,
          ),
        ),
      ],
    );
  }

  void _onChange(value) {
    currentPage = value;
    setState(() {});
  }
}
