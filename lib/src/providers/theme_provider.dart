import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/configs/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light();
  bool _isDarkMode = false;

  AppTheme get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppTheme.dark() : AppTheme.light();
    notifyListeners();
  }

  // Optional: Persist theme
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
