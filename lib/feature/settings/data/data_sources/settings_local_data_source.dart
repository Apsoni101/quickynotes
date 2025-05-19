import 'package:flutter/material.dart';
import 'package:quicky_notes/core/utlis/shared_prefs.dart';

class SettingsLocalDataSource {
  final SharedPrefs sharedPrefs;

  SettingsLocalDataSource({required this.sharedPrefs});

  ThemeMode getTheme() => sharedPrefs.getThemeMode();
  Future<void> setTheme(ThemeMode mode) => sharedPrefs.setThemeMode(mode);

  Locale getLocale() => sharedPrefs.getLocale();
  Future<void> setLocale(Locale locale) => sharedPrefs.setLocale(locale);
}
