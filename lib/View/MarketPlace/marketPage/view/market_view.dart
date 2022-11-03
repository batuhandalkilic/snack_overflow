// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Base/models/base_model_user.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/cache/hive.dart';

import '../../../../Core/Base/models/base_model_list.dart';

import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/components/Carousel/carousel_with_details_4Image.dart';
import '../../../../Core/components/Carousel/large_carousel.dart';
import '../../../../Core/extension/build_extension.dart';
import '../../../widget/details.dart';
import '../../../widget/searchingButton.dart';
import '../../../widget/searching_no_result.dart';
import '../../../widget/subsection_title.dart';
import '../viewmodel/market_view_model.dart';

class MarketView extends ConsumerStatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends MarketPageViewModel {
  @override
  Widget build(BuildContext context) {
    final typingValue = ref.watch(typingStringProvider);
    return Scaffold(
        body: Padding(
      padding: context.horizantalPaddingMedium,
      child: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        //Status 1-""/ 2-"tapping" / 3-"typing" => else
        children: searchingStatus(typingValue),
      ),
    ));
  }

  List<Widget> searchingStatus(String status) {
    final userId = ref.watch(userIdProvider);
    if (status == "") {
      return [
        context.sizedBoxHeightBoxLow4x,
        SearchTextField(ref: ref, typingValue: status),
        context.sizedBoxHeightBoxLow2x,
        SubsectionTitle(subsectionTitle: "Recent users' bundles", onPressed: (() {})),
        CarouselWithDetails4Image(list: carsouseWithDetails4ImageList),
        SubsectionTitle(subsectionTitle: 'Top 3 Popular bundles', onPressed: (() {})),
        LargeCarousel(isDirection: false, objectList: largeCarouselModelList),
        SubsectionTitle(subsectionTitle: "People nearby favorites", onPressed: (() {})),
        CarouselWithDetails(
          smallImageMode: true,
          carouselWithDetailsModel: carouselWithDetailsModelList,
        ),
      ];
    } else if (status == "tapping") {
      return [
        context.sizedBoxHeightBoxLow4x,
        SearchTextField(ref: ref, typingValue: status),
        Text(
          "Recent Searches",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        (ref.read(cacheProvider).getUser(userId ?? "")?.recentSearches ?? []).isEmpty
            ? const Text("Arama geçmişi yok")
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ref.watch(cacheProvider).getUser(userId ?? "")?.recentSearches?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.watch_later),
                    title: Text(ref.watch(cacheProvider).getUser(userId ?? "")?.recentSearches![index] ?? "null"),
                  );
                },
              ),
        Text(
          "Suggested",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: suggestedList().length,
          itemBuilder: (BuildContext context, int index) {
            BaseModelList currentObjectt = suggestedList()[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => Details(
                          currenObject: currentObjectt,
                        ))));
              },
              leading: const Icon(Icons.favorite),
              title: Text(currentObjectt.title),
            );
          },
        ),

        //
      ];
    } else {
      return [
        context.sizedBoxHeightBoxLow4x,
        SearchTextField(ref: ref, typingValue: status),
        context.sizedBoxHeightBoxLow4x,
        Text(
          "Search result",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        queryList().isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: queryList().length,
                itemBuilder: (BuildContext context, int index) {
                  final currentModell = queryList()[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      context.sizedBoxHeightBoxLow4x,
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Details(
                                    currenObject: currentModell,
                                  ))));

                          User? aaa = ref.read(cacheProvider).getUser(userId ?? "");
                          if (aaa!.recentSearches!.length <= 2) {
                            aaa = aaa.copyWith(recentSearches: [currentModell.title, ...aaa.recentSearches!]);
                            await ref.read(cacheProvider).putUser(aaa);
                          } else {
                            aaa.recentSearches!.removeAt(2);
                            aaa = aaa.copyWith(recentSearches: [
                              currentModell.title,
                              ...aaa.recentSearches!,
                            ]);
                            await ref.read(cacheProvider).putUser(aaa);
                          }
                        },
                        child: Text(
                          currentModell.title,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColorStyle.instance.gandalf),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                },
              )
            : const SearchingNoResult(),
      ];
    }
  }
}
