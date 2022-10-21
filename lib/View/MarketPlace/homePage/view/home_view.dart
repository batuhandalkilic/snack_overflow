// ignore_for_file: public_member_api_docs, sort_constructors_firs

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/Theme/app_text_style.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/View/MarketPlace/homePage/model/large_carousel_model.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import '../../../../Core/components/Carousel/carousel_with_details_4Image.dart';
import '../../../../Core/components/Carousel/large_carousel.dart';
import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/components/card/hero_card.dart';
import '../../../authentication/welcome pages/sign up page/model/user_model.dart';
import '../../../widget/button_view_more.dart';
import '../../../widget/subsection_title.dart';
import '../model/carouseWithDetails4Image_model.dart';
import '../model/carouselWithDetails_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<LargeCarouselModel> list = [
    LargeCarouselModel(imagePath: "googleLogo".toIconPng, onImagedescribe: "xaadasdadxax"),
    LargeCarouselModel(imagePath: "googleLogo".toIconPng)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            HeroCard(),
            context.sizedBoxHeightBoxLow4x,
            Padding(
              padding: context.horizantalPaddingMedium,
              child: Column(
                children: [
                  SubsectionTitle(subsectionTitle: "Daily quests", onPressed: (() {})),
                  LargeCarousel(objectList: list),
                  SubsectionTitle(subsectionTitle: "Popular items", onPressed: (() {})),
                  CarouselWithDetails(
                    smallImageMode: false,
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
                  SubsectionTitle(subsectionTitle: "Recommended for you", onPressed: (() {})),
                  CarouselWithDetails(
                    smallImageMode: false,
                    carouselWithDetailsModel: [
                      CarouselWithDetailsModel(
                          iconss: Icons.access_alarm_outlined,
                          imagePath: "onboardingSecond".toOnboardingPng,
                          title: "türk kahvesi",
                          describe: "müdasdadaddk",
                          rate: "2",
                          time: "14"),
                      CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "müdasdadadk", rate: "2", time: "14"),
                      CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                      CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                      CarouselWithDetailsModel(imagePath: "iMail".toIconPng, title: "türk kahvesi", describe: "mük", rate: "2", time: "14"),
                    ],
                  ),
                  SubsectionTitle(subsectionTitle: "Seasonal bundles", onPressed: (() {})),
                  CarouselWithDetails4Image(list: []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}