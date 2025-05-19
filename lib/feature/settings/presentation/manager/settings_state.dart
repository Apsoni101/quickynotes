part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.themeMode, required this.locale});
  final ThemeMode themeMode;
  final Locale locale;

  SettingsState copyWith({final ThemeMode? themeMode, final Locale? locale}) =>
      SettingsState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  @override
  List<Object?> get props => <Object?>[themeMode, locale];
}
