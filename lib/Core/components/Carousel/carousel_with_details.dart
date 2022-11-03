import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Base/models/carouselWithDetails_model.dart';
import '../../Theme/app_color_style.dart';
import '../../extension/build_extension.dart';

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
      height: 280.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: carouselWithDetailsModel.length,
          itemBuilder: ((context, index) {
            return UnconstrainedBox(
              child: Container(
                padding: context.horizantalPaddingSmall,
                width: smallImageMode ? 190.w : 290.w,
                height: 280.h, //
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: smallImageMode ? 160.w : 290.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(carouselWithDetailsModel[index].imagePath ?? "")),
                        borderRadius: context.buttonRadius,
                      ),
                    ),
                    Row(
                      children: [
                        (carouselWithDetailsModel[index].titleIcons != null) ? Icon(carouselWithDetailsModel[index].titleIcons) : Container(),
                        (carouselWithDetailsModel[index].titleIcons != null) ? context.sizedBoxWidthBoxLow : const SizedBox(),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            carouselWithDetailsModel[index].title,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.teflon),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      carouselWithDetailsModel[index].describe ?? "No describe",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
