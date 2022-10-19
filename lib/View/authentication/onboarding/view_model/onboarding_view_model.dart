import 'package:flutter/material.dart';
import 'package:snack_overflow/Core/extension/string_extension.dart';

import '../model/onboardin_model.dart';
import '../view/onboradin_view.dart';

abstract class OnboardingViewModel extends State<OnboradinView> {
  int currentPage = 0;
  final PageController pageController = PageController();

  List<OnboardingModel> _bodyList() {
    List<OnboardingModel> list = [];
    list.add(OnboardingModel(path: 'onboardingFirst'.toPng, description: 'Hand-pickle high quality snacks.'));
    list.add(OnboardingModel(path: 'onboardingSecond'.toPng, description: 'Shop global. Mind-blownly affordable.'));
    list.add(OnboardingModel(path: 'onboardingThird'.toPng, description: 'Deliver on the promise of time.'));
    return list;
  }

  List<OnboardingModel> get list => _bodyList();
}
