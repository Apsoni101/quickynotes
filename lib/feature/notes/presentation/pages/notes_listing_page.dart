import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_listing_bloc/notes_listing_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/no_notes.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/notes_listing_appbar.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/notes_listing_page_body.dart';

@RoutePage()
class NotesListingPage extends StatelessWidget {
  const NotesListingPage({super.key});

  Future<void> _navigateToAddNote(final BuildContext context) async {
    await context.router.navigate(const NotesAddingRoute());
  }

  @override
  Widget build(final BuildContext context) => BlocProvider<NotesListBloc>(
    create:
        (final BuildContext context) =>
            AppInjector.getIt<NotesListBloc>()..add(NotesListStarted()),
    child: Scaffold(
      appBar: const NotesListingAppBar(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => _navigateToAddNote(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NotesListBloc, NotesListState>(
        builder: (final BuildContext context, final NotesListState state) {
          switch (state) {
            case NotesListLoading():
            case NotesListInitial():
              return const Center(child: CircularProgressIndicator());
            case NotesListLoaded(:final List<NoteEntity> notes):
              if (notes.isEmpty) {
                return const NoNotes();
              }
              return NotesListingPageBody(
                notes: notes,
                onDelete: (final String noteId) {
                  context.read<NotesListBloc>().add(
                    DeleteNoteRequested(noteId),
                  );
                },
              );

            case NotesListFailure(:final String message):
              return Center(
                child: Text(
                  message,
                  style: AppTextStyles.subtitle.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
          }
        },
      ),
    ),
  );
}
