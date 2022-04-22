import 'package:flutter/material.dart';

class ColorPalette extends ChangeNotifier {
  ColorPalette._();
  static ColorPalette instance = ColorPalette._();

  bool _isDarkTheme = false;
  static get isDarkTheme => instance._isDarkTheme;

  changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
