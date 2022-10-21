import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Theme/app_color_style.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';
import 'package:snack_overflow/View/MarketPlace/market_place_provider.dart';

import 'homePage/view/home_view.dart';

class MarkatPlace extends ConsumerStatefulWidget {
  const MarkatPlace({Key? key}) : super(key: key);

  @override
  _MarkatPlaceState createState() => _MarkatPlaceState();
}

class _MarkatPlaceState extends ConsumerState<MarkatPlace> {
  @override
  Widget build(BuildContext context) {
    final _currentPage = ref.watch<int>(MarketPlaceChangePageProvider);
    return Scaffold(
      body: selectedPage(_currentPage),
      bottomNavigationBar: Padding(
        padding: context.horizantalPaddingSmall,
        child: BottomNavigationBar(
          onTap: (value) {
            ref.read(MarketPlaceChangePageProvider.state).update((state) => state = value);
          },
          elevation: 0,
          backgroundColor: AppColorStyle.instance.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPage,
          unselectedItemColor: AppColorStyle.instance.gandalf,
          selectedItemColor: AppColorStyle.instance.peach,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: _Currentpage.home.label),
            BottomNavigationBarItem(icon: const Icon(Icons.shopping_basket_outlined), label: _Currentpage.market.label),
            BottomNavigationBarItem(icon: const Icon(Icons.person_pin_circle_rounded), label: _Currentpage.create.label),
            BottomNavigationBarItem(icon: const Icon(Icons.favorite_border_rounded), label: _Currentpage.wishlist.label),
            BottomNavigationBarItem(icon: const Icon(Icons.account_box_outlined), label: _Currentpage.account.label),
          ],
        ),
      ),
    );
  }

  Widget? selectedPage(int _currentPageIndex) {
    if (_currentPageIndex == _Currentpage.home.index) {
      return const HomeView();
    } else if (_currentPageIndex == _Currentpage.market.index) {
      return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 201, 243, 33),
        ),
      );
    } else if (_currentPageIndex == _Currentpage.create.index) {
      return Scaffold(
        body: Container(
          color: Color.fromARGB(255, 243, 33, 180),
        ),
      );
    } else if (_currentPageIndex == _Currentpage.wishlist.index) {
      return Scaffold(
        body: Container(
          color: Color.fromARGB(255, 243, 61, 33),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          color: Color.fromARGB(255, 13, 193, 157),
        ),
      );
    }
  }
}

enum _Currentpage {
  home('Anasayfa'),
  market('Market'),
  create('Yarat'),
  wishlist('Beğenilen'),
  account('Hesap');

  final String label;

  const _Currentpage(this.label);
}
