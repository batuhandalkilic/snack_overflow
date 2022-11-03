import 'package:flutter/material.dart';

import '../../Theme/app_color_style.dart';
import '../../extension/build_extension.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  final Color? customButtonColor;
  final VoidCallback onPressed;
  CustomPrimaryButton({
    Key? key,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    Color? customButtonColor,
    required this.onPressed,
  })  : customButtonColor = (customButtonColor != null ? customButtonColor : AppColorStyle.instance.peach),
        super(key: key);

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.customButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonRadius,
          ),
        ),
        // ignore: sort_child_properties_last
        child: Text(
          widget.description,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: widget.textColor),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
