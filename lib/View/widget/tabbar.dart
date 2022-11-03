import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/cache/hive.dart';

import '../../Core/Base/models/base_model_user.dart';

class TabLearn extends ConsumerStatefulWidget {
  const TabLearn({super.key});

  @override
  ConsumerState<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends ConsumerState<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: _MyTabVies.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = ref.read(cacheProvider).getUser("5740fc98-dd2d-4f64-9394-4fded0d97219");
    return DefaultTabController(
        length: _MyTabVies.values.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              ustTabbar(),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ListView(
                      children: [
                        TextField(
                          enableSuggestions: false,
                          cursorColor: AppColorStyle.instance.clooney,
                          clipBehavior: Clip.none,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.none),
                          decoration: InputDecoration(
                            labelText: "Adress",
                            labelStyle: Theme.of(context).textTheme.caption,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: ((value) {
                            user = user?.copyWith(adress: value);
                            ref.read(cacheProvider).putUser(user!);
                          }),
                        ),
                        TextField(
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.none),
                          enableSuggestions: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: Theme.of(context).textTheme.caption,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: ((value) {
                            user = user?.copyWith(password: value);
                            ref.read(cacheProvider).putUser(user!);
                          }),
                        )
                      ],
                    ),
                    ListView(
                      children: [
                        TextFormField(
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null) {
                              if (value.length == 16) {
                                return null;
                              } else {
                                return "16 haneli kredi numarnızı girin";
                              }
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.none),
                          enableSuggestions: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Credi Cart",
                            labelStyle: Theme.of(context).textTheme.caption,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: ((value) {
                            user = user?.copyWith(password: value);
                            ref.read(cacheProvider).putUser(user!);
                          }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  TabBar ustTabbar() {
    return TabBar(
      labelColor: Colors.red,
      // isScrollable: true, // sıkıştırır
      controller: _tabController,
      tabs: [
        Tab(text: _MyTabVies.personal.label),
        Tab(text: _MyTabVies.paymentSettings.label),
      ],
    );
  }
}

enum _MyTabVies {
  personal("Kişisel Bilgiler"),
  paymentSettings("Ödeme Ayarları");

  final String label;

  const _MyTabVies(this.label);
}
