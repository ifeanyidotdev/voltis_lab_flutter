import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/configs/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.dark();
  bool _isDarkMode = true;

  AppTheme get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppTheme.dark() : AppTheme.light();
    saveThemePreference();
    notifyListeners();
  }

  void loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentTheme = _isDarkMode ? AppTheme.dark() : AppTheme.light();
    notifyListeners();
  }

  void saveThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }
}
