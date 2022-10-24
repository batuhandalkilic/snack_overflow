import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Theme/app_color_style.dart';
import '../../Core/extension/build_extension.dart';

class ButtonViewMore extends StatefulWidget {
  final VoidCallback onPressed;
  const ButtonViewMore({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonViewMore> createState() => _ButtonViewMoreState();
}

class _ButtonViewMoreState extends State<ButtonViewMore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.sm,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorStyle.instance.whitey,
      ),
      child: Center(
        child: IconButton(
            padding: context.zeroPadding,
            onPressed: widget.onPressed,
            icon: Icon(
              size: 36.sm,
              Icons.arrow_right_alt_outlined,
              color: AppColorStyle.instance.clooney,
            )),
      ),
    );
  }
}
