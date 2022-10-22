import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/components/Carousel/carousel_with_details_4Image.dart';
import 'package:snack_overflow/Core/components/Carousel/large_carousel.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import 'package:snack_overflow/Core/Base/models/carouseWithDetails4Image_model.dart';
import 'package:snack_overflow/Core/Base/models/large_carousel_model.dart';
import 'package:snack_overflow/View/widget/subsection_title.dart';

import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/Base/models/carouselWithDetails_model.dart';
import '../viewmodel/market_view_model.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends MarketPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.horizantalPaddingMedium,
        child: ListView(
          children: [
            SubsectionTitle(subsectionTitle: "Recent users' bundles", onPressed: (() {})),
            CarouselWithDetails4Image(list: carsouseWithDetails4ImageList),
            SubsectionTitle(subsectionTitle: 'Top 3 Popular bundles', onPressed: (() {})),
            LargeCarousel(isDirection: false, objectList: largeCarouselModelList),
            SubsectionTitle(subsectionTitle: "People nearby favorites", onPressed: (() {})),
            CarouselWithDetails(
              smallImageMode: true,
              carouselWithDetailsModel: carouselWithDetailsModelList,
            ),
          ],
        ),
      ),
    );
  }
}
