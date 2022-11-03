// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/View/widget/details.dart';

import '../../Core/Base/models/base_model_list.dart';
import '../../Core/Theme/app_color_style.dart';

class Details_bundle_or_single extends StatefulWidget {
  const Details_bundle_or_single({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BaseModelList widget;

  @override
  State<Details_bundle_or_single> createState() => _Details_bundle_or_singleState();
}

class _Details_bundle_or_singleState extends State<Details_bundle_or_single> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: context.buttonRadius,
            border: Border.all(width: 1.sm, color: AppColorStyle.instance.clooney),
          ),
          width: 140.sm,
          height: 150.sm,
          child: (widget.widget.topLeftImage == null && widget.widget.imagePath != null)
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.widget.imagePath ?? "")),
                    borderRadius: context.buttonRadius,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: context.allPaddingBase,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.widget.topLeftImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.widget.topRightImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.widget.bottomRightImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.widget.bottomLeftImage ?? "")),
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
        context.sizedBoxWidthBoxLow2x,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.widget.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColorStyle.instance.teflon),
              ),
              Text(
                widget.widget.describe ?? "",
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text("\$${widget.widget.price ?? '12'}"),
              rate_and_time(widget: widget.widget)
            ],
          ),
        ),
        // IconButton(onPressed: (() {}), icon: Icon(Icons.bookmark))
      ],
    );
  }
}
