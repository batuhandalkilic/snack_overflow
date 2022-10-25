abstract class BaseModelList {
  final String title;
  final String rate;
  final String time;
  String? price;
  String? topLeftImage;
  String? topRightImage;
  String? bottomLeftImage;
  String? bottomRightImage;
  String? describe;
  List<String>? keyword;
  String? imagePath;

  BaseModelList(this.title, this.price, this.rate, this.time);
}
