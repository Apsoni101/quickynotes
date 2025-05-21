import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/services/error/failure.dart';
import 'package:quicky_notes/feature/notes/data/data_sources/notes_remote_data_source.dart';
import 'package:quicky_notes/feature/notes/data/models/note_model.dart';
import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';
import 'package:quicky_notes/feature/notes/domain/repositories/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl({required this.remoteDataSource});

  final NotesRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> addNote(final NoteEntity note) =>
      remoteDataSource.addNote(NoteModel.fromEntity(note));

  @override
  Future<Either<Failure, Unit>> updateNote(final NoteEntity note) =>
      remoteDataSource.updateNote(NoteModel.fromEntity(note));

  @override
  Future<Either<Failure, Unit>> deleteNote(final String id) =>
      remoteDataSource.deleteNote(id);

  @override
  Future<Either<Failure, NoteEntity>> getNote(final String id) async {
    final Either<Failure, NoteModel> result = await remoteDataSource.getNote(
      id,
    );
    return result.fold(Left.new, Right.new);
  }

  @override
  Stream<Either<Failure, List<NoteEntity>>> getAllNotes() =>
      remoteDataSource.listenToNotes().map(
        (final Either<Failure, List<NoteModel>> either) =>
            either.map((final List<NoteModel> noteModels) => noteModels),
      );
}
