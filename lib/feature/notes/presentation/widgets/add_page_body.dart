import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/add_note_bloc/add_note_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/add_page_loading.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/note_input_field.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class AddPageBody extends StatefulWidget {
  const AddPageBody({super.key});

  @override
  State<AddPageBody> createState() => _AddPageBodyState();
}

class _AddPageBodyState extends State<AddPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onAddNote() {
    if (_formKey.currentState?.validate() ?? false) {
      final NoteEntity note = NoteEntity(
        id: DateTime.now().toIso8601String(),
        title: _titleController.text,
        content: _contentController.text,
        createdAt: DateTime.now(),
      );

      context.read<AddNoteBloc>().add(AddNoteRequested(note));
    }
  }

  @override
  Widget build(final BuildContext context) =>
      BlocConsumer<AddNoteBloc, AddNoteState>(
        listener: (final BuildContext context, final AddNoteState state) {
          if (state is AddNoteSuccess) {
            context.router.pop(true);
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder:
            (
              final BuildContext context,
              final AddNoteState state,
            ) => switch (state) {
              AddNoteLoading() => const AddPageLoading(),
              AddNoteSuccess() => const AddPageLoading(),
              AddNoteFailure(:final String message) => Center(
                child: Text(message),
              ),
              AddNoteInitial() => Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    NoteInputField(
                      controller: _titleController,
                      labelText: AppLocalizations.of(context).title,
                      validator:
                          (final String? value) =>
                              value?.isEmpty ?? true
                                  ? AppLocalizations.of(context).enterTitle
                                  : null,
                    ),
                    NoteInputField(
                      controller: _contentController,
                      labelText: AppLocalizations.of(context).content,
                      maxLines: 5,
                      validator:
                          (final String? value) =>
                              value?.isEmpty ?? true
                                  ? AppLocalizations.of(context).enterContent
                                  : null,
                    ),
                    ElevatedButton(
                      onPressed: _onAddNote,
                      child: Text(AppLocalizations.of(context).addNoteButton),
                    ),
                  ],
                ),
              ),
            },
      );
}
