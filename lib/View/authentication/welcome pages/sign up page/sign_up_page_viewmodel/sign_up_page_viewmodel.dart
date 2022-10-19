import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/sign_up_page.dart';

abstract class SignUpPageViewmodel extends ConsumerState<SignUpPage> {
  final isVisibilityChangeProvider = StateProvider<bool>((ref) {
    return true;
  });
}
