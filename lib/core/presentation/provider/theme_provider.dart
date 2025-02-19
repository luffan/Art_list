import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get theme => _themeMode;

  void switchingTheme() {
    _themeMode = _themeMode.index == 0 || _themeMode.index == 2
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
