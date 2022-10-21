import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../../View/MarketPlace/homePage/model/large_carousel_model.dart';
import '../../Theme/app_color_style.dart';

class LargeCarousel<T extends LargeCarouselModel> extends StatelessWidget {
  final List<T> objectList;
  const LargeCarousel({
    Key? key,
    required this.objectList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: objectList.length,
          itemBuilder: ((context, index) {
            return UnconstrainedBox(
              child: Card(
                shape: BeveledRectangleBorder(borderRadius: context.buttonRadius),
                child: Container(
                  alignment: Alignment.center,
                  width: 320.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage(objectList[index].imagePath)),
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
