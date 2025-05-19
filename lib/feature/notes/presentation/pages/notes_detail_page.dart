import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_detail_bloc/note_detail_bloc.dart';
import 'package:quicky_notes/localisation/app_localizations.dart';

@RoutePage()
class NotesDetailPage extends StatefulWidget {
  const NotesDetailPage({required this.noteId, super.key});

  final String noteId;

  @override
  State<NotesDetailPage> createState() => _NotesDetailPageState();
}

class _NotesDetailPageState extends State<NotesDetailPage> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void dispose() {
    titleController?.dispose();
    contentController?.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => BlocProvider<NoteDetailBloc>(
    create:
        (_) =>
            AppInjector.getIt<NoteDetailBloc>()
              ..add(LoadNoteDetail(widget.noteId)),
    child: Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).noteDetailTitle),
        actions: <Widget>[
          BlocBuilder<NoteDetailBloc, NoteDetailState>(
            builder: (final BuildContext context, final NoteDetailState state) {
              if (state is NoteDetailLoaded) {
                return IconButton(
                  icon: Icon(state.isEditing ? Icons.close : Icons.edit),
                  onPressed: () {
                    context.read<NoteDetailBloc>().add(EditModeToggled());
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocConsumer<NoteDetailBloc, NoteDetailState>(
        listener: (final BuildContext context, final NoteDetailState state) {
          if (state is NoteDetailUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context).noteUpdatedMessage),
              ),
            );
            context.router.pop();
          }
          if (state is NoteDetailError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (final BuildContext context, final NoteDetailState state) {
          switch (state) {
            case NoteDetailLoading():
              return const Center(child: CircularProgressIndicator());

            case NoteDetailLoaded():
              if (titleController == null ||
                  titleController!.text != state.note.title) {
                titleController?.dispose();
                titleController = TextEditingController(text: state.note.title);
              }
              if (contentController == null ||
                  contentController!.text != state.note.content) {
                contentController?.dispose();
                contentController = TextEditingController(
                  text: state.note.content,
                );
              }

              return ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border:
                          state.isEditing
                              ? const OutlineInputBorder()
                              : InputBorder.none,
                      labelText: AppLocalizations.of(context).title,
                      labelStyle: AppTextStyles.headline2,
                    ),
                    readOnly: !state.isEditing,
                    style: AppTextStyles.headline1,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      border:
                          state.isEditing
                              ? const OutlineInputBorder()
                              : InputBorder.none,
                      labelStyle: AppTextStyles.title.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      labelText: AppLocalizations.of(context).content,
                    ),
                    readOnly: !state.isEditing,
                    style: AppTextStyles.headline2,
                  ),
                  const SizedBox(height: 20),

                  if (state.isEditing) ...<Widget>[
                    ElevatedButton(
                      onPressed: () {
                        final NoteEntity updatedNote = state.note.copyWith(
                          title: titleController!.text,
                          content: contentController!.text,
                        );
                        context.read<NoteDetailBloc>().add(
                          UpdateNotePressed(updatedNote),
                        );
                      },
                      child: Text(AppLocalizations.of(context).saveChanges),
                    ),
                  ],
                ],
              );
            case NoteDetailError():
              return Center(child: Text(state.message));
            case NoteDetailInitial():
            case NoteDetailUpdated():
              return const SizedBox.shrink();
          }
        },
      ),
    ),
  );
}
