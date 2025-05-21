import 'package:flutter/material.dart';
import 'package:quicky_notes/feature/settings/domain/repositories/settings_repository.dart';

class SettingsUseCase {
  SettingsUseCase({required this.repository});
  final SettingsRepository repository;

  ThemeMode getThemeMode() => repository.getThemeMode();
  Locale getLocale() => repository.getLanguage();

  Future<void> saveThemeMode(final ThemeMode mode) =>
      repository.saveThemeMode(mode);

  Future<void> saveLocale(final Locale locale) =>
      repository.saveLanguage(locale);
}
