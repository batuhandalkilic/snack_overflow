import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String description;
  final double? buttonHeight;
  final Color? textColor;
  final Color? customButtonColor;
  const CustomPrimaryButton({
    Key? key,
    required this.description,
    this.buttonHeight = 56,
    this.textColor = Colors.white,
    this.customButtonColor = Colors.orangeAccent,
  }) : super(key: key);

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
        child: Text(
          widget.description,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: widget.textColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
