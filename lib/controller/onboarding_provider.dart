import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentIndex = 0;
  final pageController = PageController();

  Future<void> setShowHome(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', value);
  }

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
