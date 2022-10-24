import 'package:flutter/cupertino.dart';

import 'base_model_list.dart';
import 'large_carousel_model.dart';

class CarouselWithDetailsModel extends LargeCarouselModel implements BaseModelList {
  final List<String> keyword;
  final String title;
  IconData? titleIcons;
  final String describe;
  final String rate;
  final String time;
  String? price;

  CarouselWithDetailsModel({
    required super.imagePath,
    IconData? iconss,
    this.price,
    required this.keyword,
    required this.title,
    required this.describe,
    required this.rate,
    required this.time,
  }) : titleIcons = iconss;

  @override
  String? bottomLeftImage;

  @override
  String? bottomRightImage;

  @override
  String? topLeftImage;

  @override
  String? topRightImage;
}
