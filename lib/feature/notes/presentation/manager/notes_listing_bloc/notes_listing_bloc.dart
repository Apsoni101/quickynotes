// notes_list_bloc.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/services/error/failure.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/domain/use_cases/notes_use_case.dart';

part 'notes_listing_event.dart';

part 'notes_listing_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc({required this.useCases}) : super(NotesListInitial()) {
    on<NotesListStarted>(_onNotesListStarted);
    on<DeleteNoteRequested>(_onDeleteNoteRequested);
  }

  final NotesUseCases useCases;

  Future<void> _onNotesListStarted(
    final NotesListStarted event,
    final Emitter<NotesListState> emit,
  ) async {
    emit(NotesListLoading());
    await emit.forEach<Either<Failure, List<NoteEntity>>>(
      useCases.getAllNotes(),
      onData:
          (final Either<Failure, List<NoteEntity>> result) => result.fold(
            (final Failure failure) =>
                NotesListFailure(message: failure.message),
            (final List<NoteEntity> notes) => NotesListLoaded(notes: notes),
          ),
      onError: (_, _) => const NotesListFailure(message: 'Unexpected Error'),
    );
  }

  Future<void> _onDeleteNoteRequested(
    final DeleteNoteRequested event,
    final Emitter<NotesListState> emit,
  ) async {
    await useCases.deleteNote(event.id);
  }
}
//on data two api and fav list
