// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Base/models/base_model_list.dart';
import 'package:snack_overflow/Core/components/card/hero_card.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../Core/Theme/app_color_style.dart';
import '../../Core/components/button/custom_icon_button.dart';

class Details<T extends BaseModelList> extends StatefulWidget {
  final T currenObject;
  const Details({
    Key? key,
    required this.currenObject,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search result detail",
          ),
        ),
        body: ListView(
          children: <Widget>[
            HeroCard(path: widget.currenObject.bottomRightImage ?? "", subTitleText: widget.currenObject.title),
            context.sizedBoxHeightBoxLow4x,
            Padding(
              padding: context.horizantalPaddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.currenObject.price ?? "Satış yok",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      context.sizedBoxWidthBoxLow2x,
                      Icon(
                        Icons.star_outlined,
                        size: 16.sm,
                        color: AppColorStyle.instance.orange,
                      ),
                      context.sizedBoxWidthBoxLow,
                      Text(
                        widget.currenObject.rate,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      context.sizedBoxWidthBoxLow3x,
                      Icon(
                        Icons.access_time_filled_outlined,
                        size: 12.sm,
                      ),
                      context.sizedBoxWidthBoxLow,
                      Text(
                        widget.currenObject.time,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColorStyle.instance.clooney),
                      ),
                    ],
                  ),
                  context.sizedBoxHeightBoxLow4x,
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, “Anakin Is Gone. I'm What Remains.”, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
                  context.sizedBoxHeightBoxLow4x,
                  Text(
                    "Find it in a bundle",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.black),
                  ),
                  context.sizedBoxHeightBoxLow4x,
                  CustomPrimaryIconButton(
                      isTextAlignCenter: true, description: 'Add to shopping cart', onPressed: (() {}), icon: Icon(Icons.add_shopping_cart_outlined)),
                  context.sizedBoxHeightBoxLow4x,
                  CustomPrimaryIconButton(
                      textColor: AppColorStyle.instance.peach,
                      customButtonColor: AppColorStyle.instance.karlPressed,
                      isTextAlignCenter: true,
                      description: 'Save to wishlist',
                      onPressed: (() {}),
                      icon: Icon(
                        Icons.bookmark,
                        color: AppColorStyle.instance.peach,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class aasaad<T extends BaseModelList> extends StatelessWidget {
  final T currenObject;
  const aasaad({super.key, required this.currenObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.buttonRadius,
        border: Border.all(width: 1.sm, color: AppColorStyle.instance.clooney),
      ),
      height: 120.w,
      width: 120.w,
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
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(currenObject.topLeftImage ?? "")),
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
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(currenObject.topRightImage ?? "")),
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
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(currenObject.bottomRightImage ?? "")),
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
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(currenObject.bottomLeftImage ?? "")),
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
    );
  }
}
