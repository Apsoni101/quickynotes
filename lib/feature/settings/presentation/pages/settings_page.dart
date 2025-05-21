import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/feature/settings/presentation/manager/settings_bloc.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    final AppLocalizations loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.settingsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(loc.darkTheme),
                Switch(
                  value:
                      context.watch<SettingsBloc>().state.themeMode ==
                      ThemeMode.dark,
                  onChanged: (_) => settingsBloc.add(const ChangeThemeEvent()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(loc.changeLanguage),
                DropdownButton<Locale>(
                  value: context.watch<SettingsBloc>().state.locale,
                  items: <DropdownMenuItem<Locale>>[
                    DropdownMenuItem<Locale>(
                      value: const Locale('en'),
                      child: Text(loc.languageEnglish),
                    ),
                    DropdownMenuItem<Locale>(
                      value: const Locale('hi'),
                      child: Text(loc.languageHindi),
                    ),
                    DropdownMenuItem<Locale>(
                      value: const Locale('ar'),
                      child: Text(loc.languageArabic),
                    ),
                  ],
                  onChanged: (final Locale? locale) {
                    if (locale != null) {
                      settingsBloc.add(ChangeLanguageEvent(locale));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
