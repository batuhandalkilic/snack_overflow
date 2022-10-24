import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Core/Base/models/base_model_list.dart';
import '../../../../Core/Base/models/carouseWithDetails4Image_model.dart';
import '../../../../Core/Base/models/carouselWithDetails_model.dart';
import '../../../../Core/Base/models/large_carousel_model.dart';
import '../../../../Core/extension/string_extension.dart';
import '../view/market_view.dart';

abstract class MarketPageViewModel extends ConsumerState<MarketView> {
  List<CarouseWithDetails4Image_model> carsouseWithDetails4ImageList = [
    CarouseWithDetails4Image_model(
        topLeftImage: 'sushi1'.toEatPng,
        topRightImage: 'sushi2'.toEatPng,
        bottomLeftImage: 'sushi3'.toEatPng,
        bottomRightImage: 'sushi4'.toEatPng,
        title: "Japon Sushi",
        rate: '3.2',
        time: '30m',
        price: "\$50.99"),
    CarouseWithDetails4Image_model(
        topLeftImage: 'simit1'.toEatPng,
        topRightImage: 'simit2'.toEatPng,
        bottomLeftImage: 'simit3'.toEatPng,
        bottomRightImage: 'simit4'.toEatPng,
        title: 'Simit Lovers',
        rate: '4.8',
        time: '32m'),
    CarouseWithDetails4Image_model(
        topLeftImage: 'baklava'.toEatPng,
        topRightImage: 'milk'.toEatPng,
        bottomLeftImage: 'meyvetabagi'.toEatPng,
        bottomRightImage: 'fistik'.toEatPng,
        title: 'Baklava',
        rate: '5',
        time: '32m')
  ];
  List<LargeCarouselModel> largeCarouselModelList = [
    LargeCarouselModel(imagePath: "turkcayi".toEatPng, onImagedescribe: "Turkish tea time bundle"),
    LargeCarouselModel(imagePath: "samasa1".toEatPng, onImagedescribe: "Delicious Samasa bundle"),
    LargeCarouselModel(imagePath: "taiyaki1".toEatPng, onImagedescribe: "Taiyaki lovers bundle"),
  ];
  List<CarouselWithDetailsModel> carouselWithDetailsModelList = [
    CarouselWithDetailsModel(
        keyword: ["ice", "taiykai", "cream", "japanes ice"],
        imagePath: 'taiyaki1'.toEatPng,
        title: "Taiyaki",
        describe: "Japanes Ice creamaaa",
        rate: "4.3",
        time: "20m"),
    CarouselWithDetailsModel(
        keyword: ["milk", "daily", "healty"], imagePath: 'milk'.toEatPng, title: "Milk", describe: "Daily milk", rate: "5", time: "10m"),
    CarouselWithDetailsModel(
        keyword: ["sweet", "fruit", "straw"],
        imagePath: 'tatli'.toEatPng,
        title: "Fruit Jelly",
        describe: "Strawberry flavored dessert",
        rate: "4.3",
        time: "20m"),
    CarouselWithDetailsModel(
        keyword: ["samasa", "eat", "food"],
        imagePath: 'samasa1'.toEatPng,
        title: "Samasa",
        describe: "It is a fried or baked pastry of South Asia.",
        rate: "4.3",
        time: "20m",
        price: "12"),
  ];
  //öne çıkarmak istediğin ürünlere ait yeni bir list oluşturulabilir.
  //ekranda gösterdiklerini direkt aldın önerilere koydun
  List<BaseModelList> suggestedList() {
    List<BaseModelList> suggestedList = [];
    suggestedList.addAll(carouselWithDetailsModelList);
    suggestedList.addAll(carsouseWithDetails4ImageList);

    return suggestedList;
  }
}

final typingStringProvider = StateProvider<String>((ref) {
  return "";
});
