import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/localisation/app_localizations.dart';

/// Simple splash screen
@RoutePage()
class SplashPage extends StatelessWidget {
  /// Creates an instance of splash.
  const SplashPage({super.key});

  @override
  Widget build(final BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const NotesListingRoute());
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.asset(AppAssets.splashBg, fit: BoxFit.cover),

          // Centered app name text
          Align(
            child: Text(
              AppLocalizations.of(context).appName,
              style: AppTextStyles.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
