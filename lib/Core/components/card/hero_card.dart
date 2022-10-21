import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../Theme/app_color_style.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: context.zeroPadding,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Color.fromARGB(84, 0, 0, 0), BlendMode.colorBurn),
                    fit: BoxFit.cover,
                    image: NetworkImage("https://i.pinimg.com/originals/54/cd/45/54cd45ca1879ef284783b71b06928088.jpg"))),
            height: 0.35.sh,
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
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColorStyle.instance.whitey,
                    ),
                    Text(
                      "Eskişehir, Adalar",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColorStyle.instance.white),
                    ),
                  ],
                ),
                Text(
                  "Günaydın.",
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
