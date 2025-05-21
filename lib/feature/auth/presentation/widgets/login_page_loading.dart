import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class LoginPageLoading extends StatelessWidget {
  const LoginPageLoading({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Lottie.asset(AppAssets.signingLoading),
      Text(AppLocalizations.of(context).loading, style: AppTextStyles.title),
    ],
  );
}
