import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderStatusProvider = StateProvider<String>((ref) {
  return OrderStatus.waitForPayment.name;
});

enum OrderStatus { waitForPayment, paid }

final paidContainerClosedProvider = StateNotifierProvider<PaidContainerClosed, bool?>((ref) {
  return PaidContainerClosed();
});

class PaidContainerClosed extends StateNotifier<bool?> {
  PaidContainerClosed() : super(true);

  Future<void> _delayed() async {
    await Future.delayed(const Duration(seconds: 2));
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
    return null;
  }
}
