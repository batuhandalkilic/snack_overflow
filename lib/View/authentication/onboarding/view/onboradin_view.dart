import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/View/product/constants/product_text.dart';
import '../../../../Core/extension/build_extension.dart';
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
            Expanded(
              flex: 8,
              child: PageView.builder(
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
                  })),
            ),
            Flexible(
              flex: 1,
              child: sliderObserve(context),
            ),
            context.sizedBoxHeightBoxLow4x,
            Padding(
              padding: context.horizantalPaddingMedium,
              child: CustomPrimaryButton(),
            ),
            context.sizedBoxHeightBoxLow4x,
          ],
        ),
      ),
    );
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

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColorStyle.instance.peach,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8).r,
          ),
        ),
        child: Text(
          ProductText.instance.getStarted,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
