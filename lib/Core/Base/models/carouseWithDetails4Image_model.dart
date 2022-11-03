// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, camel_case_types

import 'base_model_list.dart';

class CarouseWithDetails4Image_model implements BaseModelList {
  @override
  List<String>? keyword;
  @override
  String? price;
  @override
  String? describe;
  @override
  String? imagePath;
  @override
  final String topLeftImage;
  @override
  final String topRightImage;
  @override
  final String bottomLeftImage;
  @override
  final String bottomRightImage;
  @override
  final String title;
  @override
  final String rate;
  @override
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
    // ignore: todo
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
