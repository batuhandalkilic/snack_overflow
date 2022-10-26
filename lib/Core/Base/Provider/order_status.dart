import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderStatusProvider = StateProvider<String>((ref) {
  return OrderStatus.waitForPayment.name;
});

enum OrderStatus { waitForPayment, paid }

final paidContainerClosedProvider = StateNotifierProvider<aaa, bool?>((ref) {
  return aaa();
});

class aaa extends StateNotifier<bool?> {
  aaa() : super(true);

  Future<void> _delayed() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<bool?> onChangeBool() async {
    //ilk durum ard arda 2 defa sipariş verirse diye
    if (state == false) {
      state = true;
      await _delayed();
      state = false;
    } else {
      await _delayed();
      state = false;
    }
  }
}
