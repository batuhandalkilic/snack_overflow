// ignore_for_file: public_member_api_docs, sort_constructors_firs, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Base/Provider/add_shop_list.dart';
import 'package:snack_overflow/Core/Base/Provider/order_status.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/components/button/user_shoplist_alert_button.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';
import 'package:snack_overflow/View/MarketPlace/buyPage/buy_page.dart';
import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/components/Carousel/carousel_with_details_4Image.dart';
import '../../../../Core/components/Carousel/large_carousel.dart';
import '../../../../Core/components/card/hero_card.dart';
import '../../../widget/subsection_title.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    final isShopingList = ref.watch(shopListProvider);
    final isCloseOrderButton = ref.watch(paidContainerClosedProvider) ?? true;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                HeroCard(
                  isIconVisible: true,
                  path: "turkcayi".toEatPng,
                  subTitleText: "Günaydın",
                  titleText: "Eskişehir",
                ),
                context.sizedBoxHeightBoxLow3x,
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
            isShopingList.isNotEmpty
                ? Positioned(
                    bottom: 0.h,
                    left: 8.w,
                    right: 8.w,
                    child: UserShopListAlertButton(
                        customButtonColor: AppColorStyle.instance.white.withOpacity(0.2),
                        buttonHeight: 60,
                        description: "Check out now",
                        onPressed: (() {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const BuyPAGE())));
                        })))
                : ref.watch(orderStatusProvider) == OrderStatus.paid.name
                    ? Positioned(
                        bottom: 0.h,
                        left: isCloseOrderButton ? 8.w : 10000,
                        right: isCloseOrderButton ? 8.w : 10000,
                        child: UserShopListAlertButton(
                            gradiandColorFirst: const Color.fromRGBO(200, 207, 45, 1),
                            gradiandColorSecond: const Color.fromRGBO(176, 191, 79, 1),
                            paidString: "Your order has been placed",
                            iconData: Icons.check_circle_outline,
                            customButtonColor: AppColorStyle.instance.white.withOpacity(0.2),
                            buttonHeight: 60,
                            description: "Track Delivery",
                            onPressed: (() {})))
                    : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
