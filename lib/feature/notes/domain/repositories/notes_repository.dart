import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';

abstract class NotesRepository {
  Future<Either<Failure, String>> addNote(final NoteEntity note);

  Future<Either<Failure, Unit>> updateNote(final NoteEntity note);

  Future<Either<Failure, Unit>> deleteNote(final String id);

  Future<Either<Failure, NoteEntity>> getNote(final String id);

  Stream<Either<Failure, List<NoteEntity>>> getAllNotes();
}
