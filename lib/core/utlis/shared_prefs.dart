import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale_code';

  final SharedPreferences prefs;

  SharedPrefs(this.prefs);

  ThemeMode getThemeMode() {
    final themeStr = prefs.getString(_themeKey) ?? 'light';
    return themeStr == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await prefs.setString(_themeKey, mode == ThemeMode.dark ? 'dark' : 'light');
  }

  Locale getLocale() {
    final code = prefs.getString(_localeKey) ?? 'en';
    return Locale(code);
  }

  Future<void> setLocale(Locale locale) async {
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
