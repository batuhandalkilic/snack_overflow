import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

class CustomPrimaryIconButton extends StatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  final Color? customButtonColor;
  final VoidCallback onPressed;
  final Widget icon;
  const CustomPrimaryIconButton({
    Key? key,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    this.customButtonColor = Colors.orangeAccent,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

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
          alignment: Alignment.centerLeft,
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
