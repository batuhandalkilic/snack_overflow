import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/Base/models/carouselWithDetails_model.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import '../../../../Core/Base/models/large_carousel_model.dart';

import '../view/home_view.dart';

abstract class HomeViewModel extends State<HomeView> {
  List<LargeCarouselModel> get largeCarouselModelList => [
        LargeCarouselModel(imagePath: "chips".toEatPng, onImagedescribe: "Review 10 snack of guilty pleasure"),
        LargeCarouselModel(imagePath: "badem".toEatPng, onImagedescribe: 'Review 10 snacks good for your health'),
      ];

  List<CarouselWithDetailsModel> get carouselWithDetailsModellist => [
        CarouselWithDetailsModel(imagePath: 'dalgona'.toEatPng, describe: "Korean style", title: ' Seeds aaass', time: '20m', rate: '5'),
      ];
}
