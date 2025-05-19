import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/domain/use_cases/notes_use_case.dart';

part 'note_detail_event.dart';
part 'note_detail_state.dart';

class NoteDetailBloc extends Bloc<NoteDetailEvent, NoteDetailState> {
  NoteDetailBloc({required this.useCases}) : super(const NoteDetailInitial()) {
    on<LoadNoteDetail>(_onLoadNoteDetail);
    on<EditModeToggled>(_onEditModeToggled);
    on<UpdateNotePressed>(_onUpdateNotePressed);
  }

  final NotesUseCases useCases;

  Future<void> _onLoadNoteDetail(
    final LoadNoteDetail event,
    final Emitter<NoteDetailState> emit,
  ) async {
    emit(const NoteDetailLoading());
    final Either<Failure, NoteEntity> result = await useCases.getNote(event.id);
    result.fold(
      (final Failure failure) => emit(NoteDetailError(failure.message)),
      (final NoteEntity note) => emit(NoteDetailLoaded(note)),
    );
  }

  void _onEditModeToggled(
    final EditModeToggled event,
    final Emitter<NoteDetailState> emit,
  ) {
    final NoteDetailState currentState = state;
    if (currentState is NoteDetailLoaded) {
      emit(currentState.copyWith(isEditing: !currentState.isEditing));
    }
  }

  Future<void> _onUpdateNotePressed(
    final UpdateNotePressed event,
    final Emitter<NoteDetailState> emit,
  ) async {
    final Either<Failure, Unit> result = await useCases.updateNote(
      event.updatedNote,
    );
    result.fold(
      (final Failure failure) => emit(NoteDetailError(failure.message)),
      (_) => emit(const NoteDetailUpdated()),
    );
  }
}
