// ignore_for_file: public_member_api_docs, sort_constructors_firs

import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/components/Carousel/carousel_with_details_4Image.dart';
import '../../../../Core/components/Carousel/large_carousel.dart';
import '../../../../Core/components/card/hero_card.dart';
import '../../../widget/subsection_title.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            HeroCard(
              isIconVisible: true,
              path: "turkcayi".toEatPng,
              subTitleText: "Günaydın",
              titleText: "Eskişehir",
            ),
            context.sizedBoxHeightBoxLow4x,
            Padding(
              padding: context.horizantalPaddingMedium,
              child: Column(
                children: [
                  SubsectionTitle(subsectionTitle: "Daily quests", onPressed: (() {})),
                  LargeCarousel(objectList: largeCarouselModelList),
                  SubsectionTitle(subsectionTitle: "Popular items", onPressed: (() {})),
                  CarouselWithDetails(
                    smallImageMode: true,
                    carouselWithDetailsModel: carouselWithDetailsModellist,
                  ),
                  SubsectionTitle(subsectionTitle: "Recommended for you", onPressed: (() {})),
                  CarouselWithDetails(
                    smallImageMode: false,
                    carouselWithDetailsModel: carouselWithDetailsModelLargelistt,
                  ),
                  SubsectionTitle(subsectionTitle: "Seasonal bundles", onPressed: (() {})),
                  CarouselWithDetails4Image(list: carouseWithDetails4ImagemodelList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
