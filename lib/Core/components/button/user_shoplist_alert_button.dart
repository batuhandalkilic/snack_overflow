// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../Base/Provider/add_shop_list.dart';

class UserShopListAlertButton extends ConsumerStatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  final Color? customButtonColor;
  final VoidCallback onPressed;
  Color? gradiandColorFirst;
  Color? gradiandColorSecond;
  IconData? iconData;
  String? paidString;

  UserShopListAlertButton({
    Key? key,
    Color? customButtonColor,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    required this.onPressed,
    this.gradiandColorFirst,
    this.gradiandColorSecond,
    this.iconData,
    this.paidString,
  })  : customButtonColor = (customButtonColor != null ? customButtonColor : AppColorStyle.instance.green),
        super(key: key);

  @override
  ConsumerState<UserShopListAlertButton> createState() => _UserShopListAlertButton();
}

class _UserShopListAlertButton extends ConsumerState<UserShopListAlertButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.gradiandColorFirst ?? Color.fromRGBO(255, 135, 84, 1),
              widget.gradiandColorSecond ?? Color.fromRGBO(246, 152, 51, 1),
            ],
          ),
          borderRadius: context.buttonRadius),
      child: Padding(
        padding: context.allPaddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: context.verticalPaddingBase,
                  child: Icon(
                    widget.iconData ?? Icons.shopping_cart_outlined,
                    size: 20,
                    color: AppColorStyle.instance.white,
                  ),
                ),
                context.sizedBoxWidthBoxLow,
                Expanded(
                  child: Text(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColorStyle.instance.whitey),
                    widget.paidString ?? "You have ${ref.watch(shopListProvider).length} in shopping cart, check out now.",
                  ),
                ),
              ],
            ),
            context.sizedBoxHeightBoxLow4x,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: widget.customButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: context.buttonRadius,
                ),
              ),
              child: Padding(
                padding: context.allPaddingMedium,
                child: Text(
                  widget.description,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: widget.textColor),
                ),
              ),
              onPressed: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
