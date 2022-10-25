import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/View/widget/details.dart';

import '../../Core/Base/models/base_model_list.dart';
import '../../Core/Theme/app_color_style.dart';

class Details_bundle_or_single extends StatelessWidget {
  const Details_bundle_or_single({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Details<BaseModelList> widget;

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
          height: 140.sm,
          child: (widget.currenObject.topLeftImage == null && widget.currenObject.imagePath != null)
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.currenObject.imagePath ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.currenObject.topLeftImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.currenObject.topRightImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.currenObject.bottomRightImage ?? "")),
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
                                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.currenObject.bottomLeftImage ?? "")),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.currenObject.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColorStyle.instance.teflon),
              ),
              Text(
                widget.currenObject.describe ?? "",
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(widget.currenObject.price ?? "12"),
              rate_and_time(widget: widget)
            ],
          ),
        ),
        IconButton(onPressed: (() {}), icon: Icon(Icons.bookmark))
      ],
    );
  }
}
