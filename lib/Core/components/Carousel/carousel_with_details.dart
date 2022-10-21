import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../../View/MarketPlace/homePage/model/carouselWithDetails_model.dart';
import '../../Theme/app_color_style.dart';

class CarouselWithDetails<T extends CarouselWithDetailsModel> extends StatelessWidget {
  final bool smallImageMode;
  final List<T> carouselWithDetailsModel;
  const CarouselWithDetails({
    Key? key,
    this.smallImageMode = true,
    required this.carouselWithDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: carouselWithDetailsModel.length,
          itemBuilder: ((context, index) {
            return UnconstrainedBox(
              child: Container(
                padding: context.horizantalPaddingSmall,
                width: smallImageMode ? 190.w : 290.w,
                height: 260.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 160.w,
                      height: 160.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(carouselWithDetailsModel[index].imagePath)),
                        borderRadius: context.buttonRadius,
                      ),
                    ),
                    Row(
                      children: [
                        (carouselWithDetailsModel[index].titleIcons != null
                            ? Icon(
                                carouselWithDetailsModel[index].titleIcons,
                                size: 16.sm,
                              )
                            : Container()),
                        context.sizedBoxWidthBoxLow,
                        Text(
                          carouselWithDetailsModel[index].title,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.teflon),
                        )
                      ],
                    ),
                    Text(
                      carouselWithDetailsModel[index].describe,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 12.sm,
                        ),
                        context.sizedBoxWidthBoxLow,
                        Text(
                          carouselWithDetailsModel[index].rate,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.gandalf),
                        ),
                        context.sizedBoxWidthBoxLow2x,
                        Icon(
                          Icons.access_time_filled_outlined,
                          size: 12.sm,
                        ),
                        context.sizedBoxWidthBoxLow,
                        Text(
                          carouselWithDetailsModel[index].time,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.gandalf),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
