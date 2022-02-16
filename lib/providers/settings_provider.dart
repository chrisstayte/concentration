import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  late SharedPreferences prefs;

  SettingsProvider() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void setDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;

    await prefs.setBool('isDarkMode', isDarkMode);

    notifyListeners();
  }
}
