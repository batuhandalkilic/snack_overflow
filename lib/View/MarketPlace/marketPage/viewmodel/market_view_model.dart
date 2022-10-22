import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/Base/models/carouseWithDetails4Image_model.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

import '../../../../Core/Base/models/carouselWithDetails_model.dart';
import '../../../../Core/Base/models/large_carousel_model.dart';
import '../view/market_view.dart';

abstract class MarketPageViewModel extends State<MarketView> {
  List<CarouseWithDetails4Image_model> get carsouseWithDetails4ImageList => [
        CarouseWithDetails4Image_model(
            topLeftImage: 'sushi1'.toEatPng,
            topRightImage: 'sushi2'.toEatPng,
            bottomLeftImage: 'sushi3'.toEatPng,
            bottomRightImage: 'sushi4'.toEatPng,
            title: "Japon Sushi",
            rate: '3',
            time: '30'),
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
  List<LargeCarouselModel> get largeCarouselModelList => [
        LargeCarouselModel(imagePath: "turkcayi".toEatPng, onImagedescribe: "Turkish tea time bundle"),
        LargeCarouselModel(imagePath: "samasa1".toEatPng, onImagedescribe: "Delicious Samasa bundle"),
        LargeCarouselModel(imagePath: "taiyaki1".toEatPng, onImagedescribe: "Taiyaki lovers bundle"),
      ];
  List<CarouselWithDetailsModel> get carouselWithDetailsModelList => [
        CarouselWithDetailsModel(imagePath: 'taiyaki1'.toEatPng, title: "Taiyaki", describe: "Japanes Ice creamaaa", rate: "4.3", time: "20m"),
        CarouselWithDetailsModel(imagePath: 'milk'.toEatPng, title: "Milk", describe: "Daily milk", rate: "5", time: "10m"),
        CarouselWithDetailsModel(
            imagePath: 'tatli'.toEatPng, title: "Fruit Jelly", describe: "Strawberry flavored dessert", rate: "4.3", time: "20m"),
        CarouselWithDetailsModel(
            imagePath: 'samasa1'.toEatPng, title: "Samasa", describe: "It is a fried or baked pastry of South Asia.", rate: "4.3", time: "20m"),
      ];
}
