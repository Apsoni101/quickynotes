import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<void> saveThemeMode(final ThemeMode themeMode);
  ThemeMode getThemeMode();
  Future<void> saveLanguage(final Locale language);
  Locale getLanguage();
}
