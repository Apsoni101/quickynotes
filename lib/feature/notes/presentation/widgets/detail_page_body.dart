import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_detail_bloc/note_detail_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/detail_page_loading.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/note_edit_input_field.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class DetailPageBody extends StatefulWidget {
  const DetailPageBody({super.key});

  @override
  State<DetailPageBody> createState() => _DetailPageBodyState();
}

class _DetailPageBodyState extends State<DetailPageBody> {
  TextEditingController? _titleController;
  TextEditingController? _contentController;

  @override
  void dispose() {
    _titleController?.dispose();
    _contentController?.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) =>
      BlocConsumer<NoteDetailBloc, NoteDetailState>(
        listener: (final BuildContext context, final NoteDetailState state) {
          if (state is NoteDetailUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context).noteUpdatedMessage),
              ),
            );
            context.router.pop();
          } else if (state is NoteDetailError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (final BuildContext context, final NoteDetailState state) {
          switch (state) {
            case NoteDetailLoading():
              return const DetailPageLoading();

            case NoteDetailLoaded():
              if (_titleController == null ||
                  _titleController!.text != state.note.title) {
                _titleController?.dispose();
                _titleController = TextEditingController(
                  text: state.note.title,
                );
              }

              if (_contentController == null ||
                  _contentController!.text != state.note.content) {
                _contentController?.dispose();
                _contentController = TextEditingController(
                  text: state.note.content,
                );
              }

              return ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  NoteEditInputField(
                    controller: _titleController!,
                    label: AppLocalizations.of(context).title,
                    isEditing: state.isEditing,
                    textStyle: AppTextStyles.headline1,
                    labelStyle: AppTextStyles.headline2,
                  ),
                  const SizedBox(height: 20),
                  NoteEditInputField(
                    controller: _contentController!,
                    label: AppLocalizations.of(context).content,
                    isEditing: state.isEditing,
                    textStyle: AppTextStyles.headline2,
                    labelStyle: AppTextStyles.title.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 10,
                  ),
                  const SizedBox(height: 20),
                  if (state.isEditing)
                    ElevatedButton(
                      onPressed: () {
                        final NoteEntity updatedNote = state.note.copyWith(
                          title: _titleController!.text,
                          content: _contentController!.text,
                        );
                        context.read<NoteDetailBloc>().add(
                          UpdateNotePressed(updatedNote),
                        );
                      },
                      child: Text(AppLocalizations.of(context).saveChanges),
                    ),
                ],
              );

            case NoteDetailError():
              return Center(child: Text(state.message));

            case NoteDetailInitial():
            case NoteDetailUpdated():
              return const SizedBox.shrink();
          }
        },
      );
}
