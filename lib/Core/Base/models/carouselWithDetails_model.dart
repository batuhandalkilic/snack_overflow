// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'base_model_list.dart';

class CarouselWithDetailsModel implements BaseModelList {
  @override
  List<String>? keyword;
  @override
  final String title;
  IconData? titleIcons;
  @override
  String? describe;
  @override
  final String rate;
  @override
  final String time;
  @override
  String? price;
  @override
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
