import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

class SearchingNoResult extends StatelessWidget {
  const SearchingNoResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLarge,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.error,
                color: Colors.yellow,
              ),
              context.sizedBoxWidthBoxLow3x,
              Expanded(
                  child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Try someting like Baklava',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColorStyle.instance.teflon))
                    ],
                    text: 'The item you are looking for is not available in our library.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColorStyle.instance.gandalf)),
              ))
            ],
          ),
          context.sizedBoxHeightBoxLow,
          const Divider(
            thickness: 2,
          ),
          Container(
            height: 520.h,
            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('onboardingFirst'.toOnboardingPng))),
          ),
        ],
      ),
    );
  }
}
