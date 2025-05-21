import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class AddPageLoading extends StatelessWidget {
  const AddPageLoading({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Lottie.asset(AppAssets.loading),
      Text(AppLocalizations.of(context).adding, style: AppTextStyles.title),
    ],
  );
}
