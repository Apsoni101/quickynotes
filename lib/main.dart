import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quicky_notes/core/navigation/app_router.dart';
import 'package:quicky_notes/firebase_options.dart';
import 'package:quicky_notes/localisation/app_localizations.dart';
/// The main entry point of the Flutter application.
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}
/// Sets up the [MaterialApp] with a default theme and home screen.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
   MyApp({super.key});

   ///appRouter
  final AppRouter _appRouter=AppRouter();
  @override
  Widget build(final BuildContext context) => MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    routerConfig:_appRouter.config() ,
    locale: const Locale('en'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    );

}
