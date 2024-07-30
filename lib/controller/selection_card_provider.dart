import 'package:flutter/material.dart';

class SelectionCardProvider with ChangeNotifier {
  bool _isSettingEnabled = false;

  bool get isSettingEnabled => _isSettingEnabled;

  void toggleSetting() {
    _isSettingEnabled = !_isSettingEnabled;
    notifyListeners();
  }
}
