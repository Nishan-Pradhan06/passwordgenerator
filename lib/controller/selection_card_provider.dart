import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionCardProvider with ChangeNotifier {
  final Map<int, bool> _toggleStates = {};

  SelectionCardProvider() {
    _loadToggleStates();
  }

  bool isSettingEnabled(int index) {
    return _toggleStates[index] ?? (index == 0);
  }

  void toggleSetting(int index) {
    _toggleStates[index] = !isSettingEnabled(index);
    _saveToggleState(index, _toggleStates[index]!);
    notifyListeners();
  }

  Future<void> _loadToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    for (var key in keys) {
      final intKey = int.tryParse(key);
      if (intKey != null) {
        _toggleStates[intKey] = prefs.getBool(key) ?? false;
      }
    }
    notifyListeners();
  }

  Future<void> _saveToggleState(int index, bool state) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(index.toString(), state);
  }
}
