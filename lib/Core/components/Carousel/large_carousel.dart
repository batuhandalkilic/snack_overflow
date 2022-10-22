// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../../View/MarketPlace/homePage/model/large_carousel_model.dart';
import '../../Theme/app_color_style.dart';

// ignore: must_be_immutable
// vertical için false değeri ver!
class LargeCarousel<T extends LargeCarouselModel> extends StatelessWidget {
  bool isDirection;
  final List<T> objectList;
  LargeCarousel({
    Key? key,
    this.isDirection = true,
    required this.objectList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isDirection == true ? 202.h : null,
      child: ListView.builder(
          // dikeyde ana ekran hareket edebilsin diye
          physics: isDirection == true ? null : const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: isDirection == true ? Axis.horizontal : Axis.vertical,
          itemCount: objectList.length,
          itemBuilder: ((context, index) {
            return UnconstrainedBox(
              child: Card(
                shape: BeveledRectangleBorder(borderRadius: context.buttonRadius),
                child: Container(
                  alignment: Alignment.center,
                  width: isDirection == true ? 320.w : 370.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: isDirection == false ? ColorFilter.mode(AppColorStyle.instance.black.withOpacity(0.2), BlendMode.colorBurn) : null,
                      fit: BoxFit.cover,
                      image: AssetImage(objectList[index].imagePath),
                    ),
                    borderRadius: context.buttonRadius,
                  ),
                  child: Padding(
                    padding: context.horizantalPaddingXlarge,
                    child: Text(
                      objectList[index].onImagedescribe ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.white),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
