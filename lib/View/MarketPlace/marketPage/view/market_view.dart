import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/components/Carousel/carousel_with_details_4Image.dart';
import 'package:snack_overflow/Core/components/Carousel/large_carousel.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import 'package:snack_overflow/View/MarketPlace/homePage/model/carouseWithDetails4Image_model.dart';
import 'package:snack_overflow/View/MarketPlace/homePage/model/large_carousel_model.dart';
import 'package:snack_overflow/View/widget/subsection_title.dart';

import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../homePage/model/carouselWithDetails_model.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.horizantalPaddingMedium,
        child: ListView(
          children: [
            SubsectionTitle(subsectionTitle: "Recent users' bundles", onPressed: (() {})),
            CarouselWithDetails4Image(list: [
              CarouseWithDetails4Image_model(
                  topLeftImage: 'sushi1'.toEatPng,
                  topRightImage: 'sushi2'.toEatPng,
                  bottomLeftImage: 'sushi3'.toEatPng,
                  bottomRightImage: 'sushi4'.toEatPng,
                  title: "Japon Sushi",
                  rate: '3',
                  time: '30'),
              CarouseWithDetails4Image_model(
                  topLeftImage: 'sushi1'.toEatPng,
                  topRightImage: 'sushi2'.toEatPng,
                  bottomLeftImage: 'sushi3'.toEatPng,
                  bottomRightImage: 'sushi4'.toEatPng,
                  title: "Japon Sushi",
                  rate: '3',
                  time: '30'),
              CarouseWithDetails4Image_model(
                  topLeftImage: 'sushi1'.toEatPng,
                  topRightImage: 'sushi2'.toEatPng,
                  bottomLeftImage: 'sushi3'.toEatPng,
                  bottomRightImage: 'sushi4'.toEatPng,
                  title: "Japon Sushi",
                  rate: '3',
                  time: '30'),
              CarouseWithDetails4Image_model(
                  topLeftImage: 'sushi1'.toEatPng,
                  topRightImage: 'sushi2'.toEatPng,
                  bottomLeftImage: 'sushi3'.toEatPng,
                  bottomRightImage: 'sushi4'.toEatPng,
                  title: "Japon Sushi",
                  rate: '3',
                  time: '30'),
            ]),
            SubsectionTitle(subsectionTitle: 'Top 3 Popular bundles', onPressed: (() {})),
            LargeCarousel(isDirection: false, objectList: [
              LargeCarouselModel(imagePath: "turkcayi".toEatPng, onImagedescribe: "Turkish tea time bundle"),
              LargeCarouselModel(imagePath: "somato".toEatPng, onImagedescribe: "Delicious Samasa bundle"),
              LargeCarouselModel(imagePath: "taiyaki".toEatPng, onImagedescribe: "Taiyaki lovers bundle"),
            ]),
            SubsectionTitle(subsectionTitle: "People nearby favorites", onPressed: (() {})),
            CarouselWithDetails(
              smallImageMode: true,
              carouselWithDetailsModel: [
                CarouselWithDetailsModel(
                    iconss: Icons.access_alarm_outlined,
                    imagePath: "onboardingSecond".toOnboardingPng,
                    title: "türk kahvesi",
                    describe: "mük",
                    rate: "2",
                    time: "14"),
                CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
