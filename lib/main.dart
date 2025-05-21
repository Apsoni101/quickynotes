import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/core/navigation/app_router.dart';
import 'package:quicky_notes/core/services/notification/notification_service.dart';
import 'package:quicky_notes/feature/settings/presentation/manager/settings_bloc.dart';
import 'package:quicky_notes/firebase_options.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

/// The main entry point of the Flutter application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppInjector.setUp();
  await AppInjector.getIt<NotificationService>().initialize();
  runApp(MyApp());
}

/// Sets up the  with a default theme and home screen.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  MyApp({super.key});

  ///appRouter
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) => BlocProvider<SettingsBloc>(
    create: (_) => AppInjector.getIt<SettingsBloc>(),
    child: BlocBuilder<SettingsBloc, SettingsState>(
      builder:
          (final BuildContext context, final SettingsState state) =>
              MaterialApp.router(
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: state.themeMode,
                locale: state.locale,
                routerConfig: _appRouter.config(),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                debugShowCheckedModeBanner: false,
              ),
    ),
  );
}
