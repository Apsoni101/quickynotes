
import 'package:flutter/material.dart';
import 'package:quicky_notes/feature/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quicky_notes/feature/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {

  SettingsRepositoryImpl({required this.local});
  final SettingsLocalDataSource local;

  @override
  ThemeMode getThemeMode() => local.getTheme();

  @override
  Future<void> updateThemeMode(final ThemeMode mode) => local.setTheme(mode);

  @override
  Locale getLocale() => local.getLocale();

  @override
  Future<void> updateLocale(final Locale locale) => local.setLocale(locale);
}
