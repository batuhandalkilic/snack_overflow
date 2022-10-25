import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/components/button/custom_button.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/View/widget/details_bundle_or_single.dart';

import '../../../Core/Base/Provider/add_shop_list.dart';

class BuyPAGE extends ConsumerStatefulWidget {
  const BuyPAGE({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuyPAGEState();
}

class _BuyPAGEState extends ConsumerState<BuyPAGE> {
  @override
  Widget build(BuildContext context) {
    final shopList = ref.watch(shopListProvider);
    final calculateMoney = ref.watch(calculateProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shopping cart (${shopList.length.toString()})"),
        ),
        body: ListView(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shopList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    ref.read(shopListProvider.notifier).removeShopList(index);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: context.horizantalPaddingMedium,
                        child: Column(
                          children: [
                            Details_bundle_or_single(widget: shopList[index]),
                            Divider(
                              thickness: 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            shopList.isEmpty ? SizedBox.shrink() : CustomPrimaryButton(description: "Paaaay  $calculateMoney \$", onPressed: (() {}))
          ],
        ),
      ),
    );
  }
}
