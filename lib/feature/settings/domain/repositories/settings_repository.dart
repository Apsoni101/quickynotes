import 'package:flutter/material.dart';

abstract class SettingsRepository {
  ThemeMode getThemeMode();
  Future<void> updateThemeMode(ThemeMode mode);

  Locale getLocale();
  Future<void> updateLocale(Locale locale);
}
