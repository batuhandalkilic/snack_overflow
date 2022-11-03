// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/app_color_style.dart';
import '../../extension/build_extension.dart';

// ignore: must_be_immutable
class HeroCard extends StatelessWidget {
  bool? isIconVisible;
  final String path;
  String? titleText;
  final String subTitleText;
  HeroCard({
    Key? key,
    this.isIconVisible,
    required this.path,
    this.titleText,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: context.zeroPadding,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: const ColorFilter.mode(Color.fromARGB(84, 0, 0, 0), BlendMode.colorBurn),
                    fit: BoxFit.cover,
                    image: AssetImage(path))),
            height: 0.23.sh,
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: context.horizantalPaddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isIconVisible != null
                        ? Icon(
                            Icons.location_on_outlined,
                            color: AppColorStyle.instance.whitey,
                          )
                        : const SizedBox(),
                    Text(
                      titleText ?? "",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColorStyle.instance.white),
                    ),
                  ],
                ),
                Text(
                  subTitleText,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColorStyle.instance.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
