part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeThemeEvent extends SettingsEvent {
  const ChangeThemeEvent();
}

final class ChangeLanguageEvent extends SettingsEvent {
  final Locale locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
