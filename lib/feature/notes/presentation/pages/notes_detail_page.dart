import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_detail_bloc/note_detail_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/detail_page_app_bar_actions.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/detail_page_body.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

@RoutePage()
class NotesDetailPage extends StatelessWidget {
  const NotesDetailPage({required this.noteId, super.key});

  final String noteId;

  @override
  Widget build(final BuildContext context) => BlocProvider<NoteDetailBloc>(
    create:
        (_) => AppInjector.getIt<NoteDetailBloc>()..add(LoadNoteDetail(noteId)),
    child: Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).noteDetailTitle),
        actions: const <Widget>[DetailPageAppBarActions()],
      ),
      body: const DetailPageBody(),
    ),
  );
}
