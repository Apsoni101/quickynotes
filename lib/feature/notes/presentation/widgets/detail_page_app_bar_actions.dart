import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_detail_bloc/note_detail_bloc.dart';

class DetailPageAppBarActions extends StatelessWidget {
  const DetailPageAppBarActions({super.key});

  @override
  Widget build(final BuildContext context) =>
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
      );
}
