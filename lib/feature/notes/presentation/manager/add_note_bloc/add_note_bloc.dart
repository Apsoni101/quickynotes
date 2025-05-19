import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/domain/use_cases/notes_use_case.dart';

part 'add_note_event.dart';

part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc({required this.useCases}) : super(AddNoteInitial()) {
    on<AddNoteRequested>(_onAddNoteRequested);
  }

  final NotesUseCases useCases;

  Future<void> _onAddNoteRequested(
    final AddNoteRequested event,
    final Emitter<AddNoteState> emit,
  ) async {
    emit(AddNoteLoading());

    final Either<Failure, String> result = await useCases.addNote(event.note);

    result.fold(
      (final Failure failure) => emit(AddNoteFailure(message: failure.message)),
      (final String id) => emit(AddNoteSuccess(id: id)),
    );
  }
}
