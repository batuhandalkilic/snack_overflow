import 'package:flutter/cupertino.dart';

import 'base_model_list.dart';
import 'large_carousel_model.dart';

class CarouselWithDetailsModel implements BaseModelList {
  List<String>? keyword;
  final String title;
  IconData? titleIcons;
  String? describe;
  final String rate;
  final String time;
  String? price;
  String? imagePath;

  CarouselWithDetailsModel({
    IconData? iconss,
    this.imagePath,
    this.price,
    this.keyword,
    required this.title,
    this.describe,
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
