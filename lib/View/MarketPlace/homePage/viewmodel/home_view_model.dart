import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Base/models/carouselWithDetails_model.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import '../../../../Core/Base/models/carouseWithDetails4Image_model.dart';
import '../../../../Core/Base/models/large_carousel_model.dart';

import '../view/home_view.dart';

abstract class HomeViewModel extends ConsumerState<HomeView> {
  List<LargeCarouselModel> get largeCarouselModelList => [
        LargeCarouselModel(imagePath: "chips".toEatPng, onImagedescribe: "Review 10 snack of guilty pleasure"),
        LargeCarouselModel(imagePath: "badem".toEatPng, onImagedescribe: 'Review 10 snacks good for your health'),
      ];

  List<CarouselWithDetailsModel> get carouselWithDetailsModellist => [
        CarouselWithDetailsModel(
            keyword: ["dalgona", "dlgona", "ice", "cream", "ceram", "sweet", "seweet", "coffee"],
            imagePath: 'dalgona'.toEatPng,
            describe: "Korean style",
            title: 'Dalgona c...',
            time: '20m',
            rate: '5'),
        CarouselWithDetailsModel(
            keyword: ["seeds", "nuts", "snack"],
            imagePath: 'cekirdek'.toEatPng,
            describe: "For afternoon t...",
            title: '🌻 Seeds',
            time: '32m',
            rate: '3.1'),
        CarouselWithDetailsModel(
            keyword: ["ice", "taiykai", "cream", "japanes ice"],
            imagePath: 'taiyaki1'.toEatPng,
            describe: "Japanese ice...",
            title: 'Taiykai',
            time: '16m',
            rate: '4.3'),
        CarouselWithDetailsModel(
            keyword: ["baklava", "sweet", "turk"],
            imagePath: 'baklava'.toEatPng,
            describe: "Baklava",
            title: 'Baklava Turk...',
            time: '30m',
            rate: '5'),
      ];

  List<CarouselWithDetailsModel> get carouselWithDetailsModelLargelistt => [
        CarouselWithDetailsModel(
            keyword: ["googie", "cookie", "sweet", "chocolate"],
            imagePath: 'kurabiye'.toEatPng,
            describe: "Good for your teeth",
            title: 'Googie Googie Cookie',
            time: '24m',
            rate: '4.7'),
        CarouselWithDetailsModel(
            keyword: ["oreo", "cereal", "sweet", "chocolate"],
            imagePath: 'oreocereal'.toEatPng,
            describe: "For Kids",
            title: 'Oreo cereal',
            time: '32m',
            rate: '3.1'),
      ];

  List<CarouseWithDetails4Image_model> get carouseWithDetails4ImagemodelList => [
        CarouseWithDetails4Image_model(
            topLeftImage: 'mooncake1'.toEatPng,
            topRightImage: 'mooncake2'.toEatPng,
            bottomLeftImage: 'mooncake3'.toEatPng,
            bottomRightImage: 'mooncake4'.toEatPng,
            title: 'Mooncakes',
            rate: "4.3",
            time: "42m"),
        CarouseWithDetails4Image_model(
            topLeftImage: 'kayisi'.toEatPng,
            topRightImage: 'kivi'.toEatPng,
            bottomLeftImage: 'kuruuzum'.toEatPng,
            bottomRightImage: 'portakal'.toEatPng,
            title: 'Dry fruits',
            rate: "4.9",
            time: "25m"),
      ];
}
