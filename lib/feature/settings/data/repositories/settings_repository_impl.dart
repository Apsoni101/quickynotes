import 'package:flutter/material.dart';
import 'package:quicky_notes/feature/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quicky_notes/feature/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.local});
  final SettingsLocalDataSource local;
  @override
  Future<void> saveThemeMode(final ThemeMode? mode) async {
    await local.saveThemeMode(mode);
  }

  @override
  ThemeMode getThemeMode() => local.getThemeMode();

  @override
  Future<void> saveLanguage(final Locale language) async {
    await local.saveLanguageCode(language.languageCode);
  }

  @override
  Locale getLanguage() => local.getLanguage();
}
