import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/feature/settings/domain/use_cases/settings_usecase.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsUseCase useCase;

  SettingsBloc({required this.useCase})
    : super(
        const SettingsState(themeMode: ThemeMode.light, locale: Locale('en')),
      ) {
    on<ChangeThemeEvent>((
      final ChangeThemeEvent event,
      final Emitter<SettingsState> emit,
    ) async {
      final newTheme =
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      await useCase.updateThemeMode(newTheme);
      emit(state.copyWith(themeMode: newTheme));
    });

    on<ChangeLanguageEvent>((
      final ChangeLanguageEvent event,
      final Emitter<SettingsState> emit,
    ) async {
      await useCase.updateLocale(event.locale);
      emit(state.copyWith(locale: event.locale));
    });
  }
}
