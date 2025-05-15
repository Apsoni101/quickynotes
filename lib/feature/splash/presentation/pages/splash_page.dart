import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/localisation/app_localizations.dart';

/// simple splash screen
@RoutePage()
class SplashPage extends StatelessWidget {
  /// Creates an instance of splash.
  const SplashPage({super.key});

  @override
  Widget build(final BuildContext context) {
    Future.delayed(const Duration(seconds: 4),(){
      context.router.push(const LoginRoute());
    });
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context).helloWorld)),
    );
  }
}
