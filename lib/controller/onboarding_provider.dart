import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentIndex = 0;
  final pageController = PageController();

  void setPageIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
