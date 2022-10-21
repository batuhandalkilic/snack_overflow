import 'package:flutter/cupertino.dart';

import 'large_carousel_model.dart';

class CarouselWithDetailsModel extends LargeCarouselModel {
  final String title;
  IconData? titleIcons;
  final String describe;
  final String rate;
  final String time;

  CarouselWithDetailsModel({
    required super.imagePath,
    IconData? iconss,
    required this.title,
    required this.describe,
    required this.rate,
    required this.time,
  }) : titleIcons = iconss;
}
