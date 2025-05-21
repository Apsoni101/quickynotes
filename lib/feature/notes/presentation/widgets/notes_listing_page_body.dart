import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/note_item_card.dart';

class NotesListingPageBody extends StatelessWidget {
  const NotesListingPageBody({
    required this.notes,
    required this.onDelete,
    super.key,
  });

  final List<NoteEntity> notes;
  final void Function(String noteId) onDelete;

  @override
  Widget build(final BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
    itemCount: notes.length,
    itemBuilder: (final BuildContext context, final int index) {
      final NoteEntity note = notes[index];
      return NoteCard(
        note: note,
        onTap: () async {
          await context.router.push(NotesDetailRoute(noteId: note.id));
        },
        onDelete: () => onDelete(note.id),
      );
    },
  );
}
