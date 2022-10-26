// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Base/models/base_model_list.dart';

import '../../Base/models/carouseWithDetails4Image_model.dart';
import '../../Theme/app_color_style.dart';
import '../../extension/build_extension.dart';

class CarouselWithDetails4Image<T extends BaseModelList> extends StatefulWidget {
  T? currenObject;
  List<CarouseWithDetails4Image_model>? list;
  CarouselWithDetails4Image({
    Key? key,
    this.currenObject,
    this.list,
  }) : super(key: key);

  @override
  State<CarouselWithDetails4Image> createState() => _CarouselWithDetails4ImageState();
}

class _CarouselWithDetails4ImageState extends State<CarouselWithDetails4Image> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list?.length ?? 0,
          itemBuilder: ((context, index) {
            return UnconstrainedBox(
              child: Container(
                padding: context.horizantalPaddingSmall,
                width: 230.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: context.buttonRadius,
                        border: Border.all(width: 1.sm, color: AppColorStyle.instance.clooney),
                      ),
                      width: 180.w,
                      height: 180.h,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: context.allPaddingBase,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.list![index].topLeftImage)),
                                        borderRadius: context.buttonRadius,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: context.allPaddingBase,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.list![index].topRightImage)),
                                        borderRadius: context.buttonRadius,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: context.allPaddingBase,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.list![index].bottomRightImage)),
                                        borderRadius: context.buttonRadius,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: context.allPaddingBase,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.list![index].bottomLeftImage)),
                                        borderRadius: context.buttonRadius,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.list![index].title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.teflon),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 12.sm,
                        ),
                        context.sizedBoxWidthBoxLow,
                        Text(
                          widget.list![index].rate,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.gandalf),
                        ),
                        context.sizedBoxWidthBoxLow2x,
                        Icon(
                          Icons.access_time_filled_outlined,
                          size: 12.sm,
                        ),
                        context.sizedBoxWidthBoxLow,
                        Text(
                          widget.list![index].time,
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
