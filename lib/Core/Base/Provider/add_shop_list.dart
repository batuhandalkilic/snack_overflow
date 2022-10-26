import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/Base/models/base_model_list.dart';

final shopListProvider = StateNotifierProvider<ShopList, List<BaseModelList>>((ref) {
  return ShopList();
});

class ShopList extends StateNotifier<List<BaseModelList>> {
  ShopList() : super([]);

  void addShopList(BaseModelList model) {
    BaseModelList newModel = model;
    state = [...state, newModel];
  }

  void removeShopList(int index) {
    state.removeAt(index);

    state = [...state];
  }

  void clearList() {
    state = [];
  }
}

final calculateProvider = Provider((ref) {
  final lll = ref.watch(shopListProvider);
  double doublePayment =
      lll.fold(0, (previousValue, element) => previousValue + (double.parse(double.parse(element.price ?? "0").toStringAsFixed(2))));

  return doublePayment;
});
