import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class SettingsLocalDataSource {
  Future<void> saveThemeMode(final ThemeMode? themeMode);

  ThemeMode getThemeMode();

  Future<void> saveLanguageCode(final String language);

  Locale getLanguage();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl({required this.sharedPrefs});

  final SharedPreferences sharedPrefs;
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language_code';

  @override
  Future<void> saveThemeMode(final ThemeMode? mode) async {
    await sharedPrefs.setString(_themeKey, mode!.name);
  }

  @override
  ThemeMode getThemeMode() {
    final String? value = sharedPrefs.getString(_themeKey);
    return _parseThemeMode(value ?? 'system');
  }

  @override
  Future<void> saveLanguageCode(final String code) async {
    await sharedPrefs.setString(_languageKey, code);
  }

  @override
  Locale getLanguage() {
    final String code = sharedPrefs.getString(_languageKey) ?? 'en';
    return Locale(code);
  }

  ThemeMode _parseThemeMode(final String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
