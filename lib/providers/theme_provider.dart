import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/strings/app_strings.dart';

/// Модель для оповещения изминении темы
class ThemeProvider extends ChangeNotifier {
  ThemeMode get themeMode => _themeMode;
  bool get isDarkTheme => _isDarkTheme();
  String get themeName => _getThemeName();

  late ThemeMode _themeMode;

  ThemeProvider() {
    _themeMode = mocksThemeMode;
  }

  void changeThemeMode({bool isDarkTheme = false}) {
    _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool _isDarkTheme() {
    return _themeMode == ThemeMode.dark;
  }

  String _getThemeName() {
    return isDarkTheme ? AppStrings.lightTheme : AppStrings.darkTheme;
  }
}
