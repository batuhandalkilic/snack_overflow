import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Core/Base/models/base_model_list.dart';
import '../../../../Core/components/Carousel/carousel_with_details.dart';
import '../../../../Core/components/Carousel/carousel_with_details_4Image.dart';
import '../../../../Core/components/Carousel/large_carousel.dart';
import '../../../../Core/extension/build_extension.dart';
import '../../../widget/details.dart';
import '../../../widget/searchingButton.dart';
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
        floatingActionButton: FloatingActionButton(onPressed: (() {})),
        body: Padding(
          padding: context.horizantalPaddingMedium,
          child: ListView(
            //Status 1-""/ 2-"tapping" / 3-"typing" => else
            children: searchingStatus(typingValue),
          ),
        ));
  }

  List<Widget> searchingStatus(String status) {
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
        // Hive aç kullanıcı girince list<String> tut ilk başta yoksa
        // arama yapılmadı yazdır
        // ilk arama yapınca hive ile kaydet ve yazdır!
        // 3 arama doldu => list 0 index son yazılanı koy
        Text(
          "Suggested",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: suggestedList().length,
          itemBuilder: (BuildContext context, int index) {
            BaseModelList currentObjectt = suggestedList()[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => Details(
                          currenObject: currentObjectt,
                        ))));
              },
              child: ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(currentObjectt.title),
              ),
            );
          },
        ),

        //
      ];
    } else {
      return [
        context.sizedBoxHeightBoxLow4x,
        SearchTextField(ref: ref, typingValue: status),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("data"),
            );
          },
        ),
      ];
    }
  }
}
