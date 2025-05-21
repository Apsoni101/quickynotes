import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class NotesListingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotesListingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(final BuildContext context) => AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).appName,
          style: AppTextStyles.headline1.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          AppLocalizations.of(context).subtitle,
          style: AppTextStyles.subtitle.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        spacing: 10,
        children: <Widget>[
          IconButton.outlined(
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            style: IconButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.all(8),
            ),
            icon: const Icon(Icons.settings, size: 28),
          ),
          const SizedBox.shrink(),
        ],
      ),
    ],
  );
}
