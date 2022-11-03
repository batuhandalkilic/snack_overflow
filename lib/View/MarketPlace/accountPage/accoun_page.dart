// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/Theme/app_text_style.dart';

import 'package:snack_overflow/Core/extension/string_extension.dart';
import 'package:snack_overflow/View/widget/details_bundle_or_single.dart';
import 'package:snack_overflow/View/widget/subsection_title.dart';
import '../../../../Core/extension/build_extension.dart';
import '../../../Core/Base/Provider/add_shop_list.dart';

import '../../widget/tabbar.dart';

class AccounPage extends ConsumerStatefulWidget {
  const AccounPage({Key? key}) : super(key: key);

  @override
  _AccounPageState createState() => _AccounPageState();
}

class _AccounPageState extends ConsumerState<AccounPage> {
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    final shopList = ref.watch(shopListProvider);

    return Scaffold(
      body: Padding(
          padding: context.horizantalAndVerticalPaddingMedium,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Text(
                      "Account",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    context.sizedBoxHeightBoxLow4x,
                    ListTile(
                      title: const Text("Tuğçe"),
                      subtitle: const Text("Eskişehir"),
                      contentPadding: context.zeroPadding,
                      trailing: IconButton(
                          onPressed: (() {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          }),
                          icon: const Icon(Icons.edit)),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage("https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg"),
                        maxRadius: 28,
                        minRadius: 24,
                      ),
                    ),
                    context.sizedBoxHeightBoxLow4x,
                    Container(
                      height: 64.h,
                      decoration: BoxDecoration(
                        borderRadius: context.buttonRadiusx2,
                        color: AppColorStyle.instance.whitey,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          context.sizedBoxWidthBoxLow2x,
                          Image.asset("accountIcon".toIconPng),
                          context.sizedBoxWidthBoxLow2x,
                          RichText(
                              text: TextSpan(
                                  text: "324 ",
                                  style: AppTextStyle.instance.footNote.copyWith(color: AppColorStyle.instance.teflon),
                                  children: [
                                TextSpan(
                                    text: "Tokens collected", style: AppTextStyle.instance.footNote.copyWith(color: AppColorStyle.instance.gandalf))
                              ]))
                        ],
                      ),
                    ),
                    context.sizedBoxHeightBoxLow4x,
                    SubsectionTitle(subsectionTitle: "Recent purshases", onPressed: (() {})),
                    context.sizedBoxHeightBoxLow4x,
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: shopList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var current = shopList[index];
                          return SizedBox(width: 300.w, child: Details_bundle_or_single(widget: current));
                        },
                      ),
                    ),
                    // son satın aldıklarını yazdır
                  ],
                ),
              ),
              isEditing == false ? const SizedBox.shrink() : const Expanded(child: TabLearn())
            ],
          )),
    );
  }
}
