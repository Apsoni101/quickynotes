import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(final BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const NotesListingRoute());
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(AppAssets.splash),
          Text(
            AppLocalizations.of(context).appName,
            style: AppTextStyles.headline1,
          ),
          Image.asset(AppAssets.splashBg, fit: BoxFit.cover),

        ],
      ),
    );
  }
}
