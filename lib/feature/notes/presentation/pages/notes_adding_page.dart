import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/add_note_bloc/add_note_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/widgets/add_page_body.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

@RoutePage()
class NotesAddingPage extends StatelessWidget {
  const NotesAddingPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<AddNoteBloc>(
    create: (_) => AppInjector.getIt<AddNoteBloc>(),
    child: Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).addNote)),
      body: const Padding(padding: EdgeInsets.all(16), child: AddPageBody()),
    ),
  );
}
