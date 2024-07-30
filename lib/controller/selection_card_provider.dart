import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:randowmpasswordgenerator/core/colors/colors.dart';

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

  int get enabledToggleCount {
    return _toggleStates.values.where((state) => state).length;
  }

  List<Color> getBarColors() {
    final enabledCount = enabledToggleCount;
    List<Color> colors = [
      BrandColors.kdisbleColor,
      BrandColors.kdisbleColor,
      BrandColors.kdisbleColor,
    ];

    if (enabledCount == 1) {
      colors[0] = BrandColors.kLow;
    } else if (enabledCount == 2) {
      colors[0] = BrandColors.kMedium;
      colors[1] = BrandColors.kMedium;
    } else if (enabledCount >= 3) {
      colors[0] = BrandColors.kStrong;
      colors[1] = BrandColors.kStrong;
      colors[2] = BrandColors.kStrong;
    }

    return colors;
  }
}
