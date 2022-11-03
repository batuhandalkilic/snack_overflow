import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/components/button/custom_button.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import 'package:snack_overflow/View/widget/details_bundle_or_single.dart';

import '../../../Core/Base/Provider/add_shop_list.dart';
import '../../../Core/Base/Provider/order_status.dart';
import '../markat_place.dart';
import '../market_place_provider.dart';

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
        body: Padding(
          padding: context.horizantalPaddingMedium,
          child: Column(
            children: [
              Expanded(
                child: ListView(
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
                              Column(
                                children: [
                                  Details_bundle_or_single(widget: shopList[index]),
                                  const Divider(
                                    thickness: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              shopList.isEmpty
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: context.verticalPaddingXlarge,
                      child: CustomPrimaryButton(
                          description: "Pay $calculateMoney \$",
                          onPressed: (() {
                            setState(() {});
                            showModalBottomSheet(
                                context: context,
                                builder: ((context) => Padding(
                                      padding: context.horizantalPaddingBase,
                                      child: Column(
                                        children: [
                                          Container(
                                              height: 40.h,
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                  onPressed: (() {
                                                    Navigator.pop(context, const BuyPAGE());
                                                  }),
                                                  child: const Text("Cancel"))),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            minLeadingWidth: 70.w,
                                            leading: const Icon(Icons.credit_card_outlined),
                                            title: Text(
                                              "**** **** **** 2505",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.black),
                                            ),
                                            trailing: IconButton(
                                                onPressed: (() {}),
                                                icon: Icon(color: AppColorStyle.instance.facebookBlue, Icons.chevron_right_outlined)),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "ADDRESS",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.clooney),
                                            ),
                                            subtitle: Text(
                                              "Ank Güzel mah. 231.sk yar sitesi b 4",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.black),
                                            ),
                                            trailing: IconButton(
                                                onPressed: (() {}),
                                                icon: Icon(color: AppColorStyle.instance.facebookBlue, Icons.chevron_right_outlined)),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "CONTACT",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.clooney),
                                            ),
                                            title: Text("aliiii",
                                                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.black)),
                                            subtitle: Text(
                                              "0000000000",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.black),
                                            ),
                                            trailing: IconButton(
                                                onPressed: (() {}),
                                                icon: Icon(color: AppColorStyle.instance.facebookBlue, Icons.chevron_right_outlined)),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "TOTAL",
                                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColorStyle.instance.clooney),
                                            ),
                                            trailing: Text("\$${calculateMoney.toStringAsFixed(2)}"),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          CustomPrimaryButton(
                                              description: "Pay",
                                              onPressed: (() {
                                                ref.read(MarketPlaceChangePageProvider.notifier).state = Currentpage.home.index;
                                                ref.read(orderStatusProvider.notifier).state = OrderStatus.paid.name;
                                                ref.read(shopListProvider.notifier).clearList();
                                                ref.read(paidContainerClosedProvider.notifier).onChangeBool();
                                                Navigator.pop(context, const BuyPAGE());
                                              }))
                                        ],
                                      ),
                                    )));
                          })),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
