import 'package:flutter/material.dart';
import 'package:quicky_notes/feature/settings/domain/repositories/settings_repository.dart';

class SettingsUseCase {
  final SettingsRepository repository;

  SettingsUseCase({required this.repository});

  // Getters
  ThemeMode getThemeMode() => repository.getThemeMode();
  Locale getLocale() => repository.getLocale();

  // Setters
  Future<void> updateThemeMode(ThemeMode mode) =>
      repository.updateThemeMode(mode);

  Future<void> updateLocale(Locale locale) =>
      repository.updateLocale(locale);
}
