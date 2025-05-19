import 'package:flutter/material.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(AppAssets.googleIc, height: 24, width: 24),
        const SizedBox(width: 12),
        Text(text),
      ],
    ),
  );
}
