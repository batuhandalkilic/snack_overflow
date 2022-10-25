// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'base_model_list.dart';

class CarouseWithDetails4Image_model implements BaseModelList {
  List<String>? keyword;
  String? price;
  String? describe;
  String? imagePath;
  final String topLeftImage;
  final String topRightImage;
  final String bottomLeftImage;
  final String bottomRightImage;
  final String title;
  final String rate;
  final String time;

  CarouseWithDetails4Image_model({
    this.keyword,
    this.price,
    this.describe,
    this.imagePath,
    required this.topLeftImage,
    required this.topRightImage,
    required this.bottomLeftImage,
    required this.bottomRightImage,
    required this.title,
    required this.rate,
    required this.time,
  });

  @override
  set bottomLeftImage(String? _bottomLeftImage) {
    // TODO: implement bottomLeftImage
  }

  @override
  set bottomRightImage(String? _bottomRightImage) {
    // TODO: implement bottomRightImage
  }

  @override
  set topLeftImage(String? _topLeftImage) {
    // TODO: implement topLeftImage
  }

  @override
  set topRightImage(String? _topRightImage) {
    // TODO: implement topRightImage
  }
}
