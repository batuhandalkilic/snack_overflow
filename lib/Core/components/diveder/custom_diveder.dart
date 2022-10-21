import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/app_color_style.dart';

class CustomDiveder extends StatelessWidget {
  const CustomDiveder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: MediaQuery.of(context).size.width / 6,
      endIndent: MediaQuery.of(context).size.width / 6,
      thickness: 1.7.w,
      color: AppColorStyle.instance.gandalf,
    );
  }
}
