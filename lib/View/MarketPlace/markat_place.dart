// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Core/Theme/app_color_style.dart';
import '../../Core/extension/build_extension.dart';
import 'accountPage/accoun_page.dart';
import 'buyPage/buy_page.dart';
import 'market_place_provider.dart';
import 'homePage/view/home_view.dart';
import 'marketPage/view/market_view.dart';

class MarkatPlace extends ConsumerStatefulWidget {
  const MarkatPlace({Key? key}) : super(key: key);

  @override
  _MarkatPlaceState createState() => _MarkatPlaceState();
}

class _MarkatPlaceState extends ConsumerState<MarkatPlace> {
  @override
  Widget build(BuildContext context) {
    final Currentpagee = ref.watch<int>(MarketPlaceChangePageProvider);
    return Scaffold(
      body: selectedPage(Currentpagee),
      bottomNavigationBar: Padding(
        padding: context.horizantalPaddingSmall,
        child: BottomNavigationBar(
          onTap: (value) {
            ref.read(MarketPlaceChangePageProvider.notifier).update((state) => state = value);
          },
          elevation: 0,
          backgroundColor: AppColorStyle.instance.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: Currentpagee,
          unselectedItemColor: AppColorStyle.instance.gandalf,
          selectedItemColor: AppColorStyle.instance.peach,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: Currentpage.home.label),
            BottomNavigationBarItem(icon: const Icon(Icons.shopping_basket_outlined), label: Currentpage.market.label),
            BottomNavigationBarItem(icon: const Icon(Icons.payment_outlined), label: Currentpage.pay.label),
            BottomNavigationBarItem(icon: const Icon(Icons.account_box_outlined), label: Currentpage.account.label),
          ],
        ),
      ),
    );
  }

  Widget? selectedPage(int currentpageIndex) {
    if (currentpageIndex == Currentpage.home.index) {
      return const HomeView();
    } else if (currentpageIndex == Currentpage.market.index) {
      return const MarketView();
    } else if (currentpageIndex == Currentpage.pay.index) {
      return const BuyPAGE();
    } else {
      return const AccounPage();
    }
  }
}

enum Currentpage {
  home('Anasayfa'),
  market('Market'),
  pay('Ödeme'),
  account('Hesap');

  final String label;

  const Currentpage(this.label);
}
