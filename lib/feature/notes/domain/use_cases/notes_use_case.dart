import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/services/error/failure.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/domain/repositories/notes_repository.dart';

class NotesUseCases {
  NotesUseCases({required this.repository});

  final NotesRepository repository;

  Future<Either<Failure, String>> addNote(final NoteEntity note) =>
      repository.addNote(note);

  Future<Either<Failure, Unit>> updateNote(final NoteEntity note) =>
      repository.updateNote(note);

  Future<Either<Failure, Unit>> deleteNote(final String id) =>
      repository.deleteNote(id);

  Future<Either<Failure, NoteEntity>> getNote(final String id) =>
      repository.getNote(id);

  Stream<Either<Failure, List<NoteEntity>>> getAllNotes() =>
      repository.getAllNotes();
}
