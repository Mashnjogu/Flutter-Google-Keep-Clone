import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
