// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodModel {
  final String keywords;
  final String title;
  final String describe;
  String? textInFrontOfImage;
  String? mainImage;
  String? text;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final String imageFour;
  final String rate;
  final String time;
  final String price;
  FoodModel({
    required this.keywords,
    required this.title,
    required this.describe,
    this.textInFrontOfImage,
    this.mainImage,
    this.text,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.imageFour,
    required this.rate,
    required this.time,
    required this.price,
  });
}
