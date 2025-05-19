import 'package:flutter/material.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/utlis/date_formatter.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/localisation/app_localizations.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.note,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  final NoteEntity note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(Icons.notes, color: theme.colorScheme.onPrimaryContainer),
        ),
        title: Text(
          note.title,
          style: AppTextStyles.noteCardTitle.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 4),
            Text(
              note.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.noteCardContent.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${AppLocalizations.of(context).createdLabel}: ${DateFormatter.formatDate(note.createdAt)}',
              style: AppTextStyles.noteCardCaption.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          color: theme.colorScheme.error,
          onPressed: onDelete,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
