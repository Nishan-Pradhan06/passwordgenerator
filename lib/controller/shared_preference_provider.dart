import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  bool _showHome = false;

  bool get showHome => _showHome;

  PreferencesProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _showHome = prefs.getBool('showHome') ?? false;
    notifyListeners();
  }

  Future<void> setShowHome(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', value);
    _showHome = value;
    notifyListeners();
  }
}
