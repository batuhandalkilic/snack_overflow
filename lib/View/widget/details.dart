// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Base/Provider/add_shop_list.dart';
import 'package:snack_overflow/Core/Base/models/base_model_list.dart';
import 'package:snack_overflow/Core/components/card/hero_card.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../Core/Theme/app_color_style.dart';
import '../../Core/components/button/custom_icon_button.dart';
import 'details_bundle_or_single.dart';

class Details<T extends BaseModelList> extends ConsumerStatefulWidget {
  final T currenObject;
  const Details({
    Key? key,
    required this.currenObject,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search result detail",
          ),
        ),
        body: ListView(
          children: <Widget>[
            HeroCard(path: widget.currenObject.topLeftImage ?? widget.currenObject.imagePath ?? "", subTitleText: widget.currenObject.title),
            context.sizedBoxHeightBoxLow4x,
            Padding(
              padding: context.horizantalPaddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  informationItems(context),
                  context.sizedBoxHeightBoxLow4x,
                  const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, “Anakin Is Gone. I'm What Remains.”, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                  context.sizedBoxHeightBoxLow4x,
                  Text(
                    "Find it in a bundle",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColorStyle.instance.black),
                  ),
                  context.sizedBoxHeightBoxLow4x,
                  Details_bundle_or_single(widget: widget.currenObject),
                  context.sizedBoxHeightBoxLow4x,
                  CustomPrimaryIconButton(
                      isTextAlignCenter: true,
                      description: 'Add to shopping cart',
                      onPressed: (() {
                        ref.read(shopListProvider.notifier).addShopList(widget.currenObject);
                        ScaffoldMessenger.of(context).showSnackBar(detailsSnackBar(widget.currenObject));
                      }),
                      icon: const Icon(Icons.add_shopping_cart_outlined)),
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
                  context.sizedBoxHeightBoxLow4x,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SnackBar detailsSnackBar(BaseModelList currenObject) => SnackBar(
      duration: const Duration(milliseconds: 300),
      backgroundColor: AppColorStyle.instance.peach,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined),
          context.sizedBoxWidthBoxLow,
          Text("${currenObject.title} eklendi"),
        ],
      ));

  Row informationItems(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${widget.currenObject.price ?? '12'}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        context.sizedBoxWidthBoxLow2x,
        rate_and_time(widget: widget.currenObject),
      ],
    );
  }
}

class rate_and_time extends StatelessWidget {
  const rate_and_time({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BaseModelList widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_outlined,
          size: 16.sm,
          color: AppColorStyle.instance.orange,
        ),
        context.sizedBoxWidthBoxLow,
        Text(
          widget.rate,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        context.sizedBoxWidthBoxLow3x,
        Icon(
          Icons.access_time_filled_outlined,
          size: 12.sm,
        ),
        context.sizedBoxWidthBoxLow,
        Text(
          widget.time,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColorStyle.instance.clooney),
        ),
      ],
    );
  }
}
