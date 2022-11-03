// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../Theme/app_color_style.dart';
import '../../extension/build_extension.dart';

class CustomPrimaryIconButton extends StatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  Color? customButtonColor;
  bool? isTextAlignCenter;
  final VoidCallback onPressed;
  final Widget icon;
  CustomPrimaryIconButton({
    Key? key,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    customButtonColor,
    isTextAlignCenter,
    required this.onPressed,
    required this.icon,
  })  : isTextAlignCenter = ((isTextAlignCenter == false || isTextAlignCenter == null) ? false : true),
        customButtonColor = (customButtonColor != null ? customButtonColor : AppColorStyle.instance.peach),
        super(key: key);

  @override
  State<CustomPrimaryIconButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        icon: widget.icon,
        style: ElevatedButton.styleFrom(
          alignment: widget.isTextAlignCenter == true ? Alignment.center : Alignment.centerLeft,
          primary: widget.customButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonRadius,
          ),
        ),
        label: Text(
          textAlign: TextAlign.left,
          widget.description,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: widget.textColor),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
