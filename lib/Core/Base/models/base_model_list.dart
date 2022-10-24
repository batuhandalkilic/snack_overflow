abstract class BaseModelList {
  final String title;
  final String rate;
  final String time;
  String? price;
  String? topLeftImage;
  String? topRightImage;
  String? bottomLeftImage;
  String? bottomRightImage;

  BaseModelList(this.title, this.price, this.rate, this.time);
}
