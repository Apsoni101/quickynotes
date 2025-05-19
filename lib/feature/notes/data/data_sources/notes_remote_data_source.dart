import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/constants/app_constants.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/core/services/firebase_firestore_service.dart';
import 'package:quicky_notes/core/services/notification_service.dart';
import 'package:quicky_notes/feature/notes/data/models/note_model.dart';

abstract class NotesRemoteDataSource {
  Future<Either<Failure, String>> addNote(final NoteModel note);

  Future<Either<Failure, Unit>> updateNote(final NoteModel note);

  Future<Either<Failure, Unit>> deleteNote(final String id);

  Future<Either<Failure, NoteModel>> getNote(final String id);

  Stream<Either<Failure, List<NoteModel>>> listenToNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  NotesRemoteDataSourceImpl({
    required this.firestoreService,
    required this.notificationService,
  });

  final FirebaseFirestoreService firestoreService;
  final NotificationService notificationService;

  @override
  Future<Either<Failure, String>> addNote(final NoteModel note) async {
    await notificationService.initialize();

    final Either<Failure, String> result = await firestoreService.addDocument(
      collectionPath: AppsConstants.notesCollection,
      data: note.toMap(),
    );

    await result.fold((_) => null, (_) async {
      await notificationService.sendNotification(
        topic: 'notes-updates',
        title: note.title,
        body: note.content,
      );
    });

    return result;
  }

  @override
  Future<Either<Failure, Unit>> updateNote(final NoteModel note) =>
      firestoreService.updateDocument(
        collectionPath: AppsConstants.notesCollection,
        docId: note.id,
        data: note.toMap(),
      );

  @override
  Future<Either<Failure, Unit>> deleteNote(final String id) => firestoreService
      .deleteDocument(collectionPath: AppsConstants.notesCollection, docId: id);

  @override
  Future<Either<Failure, NoteModel>> getNote(final String id) async {
    final Either<Failure, Map<String, dynamic>> result = await firestoreService
        .getDocument(collectionPath: AppsConstants.notesCollection, docId: id);

    return result.fold(
      Left.new,
      (final Map<String, dynamic> data) =>
          Right<Failure, NoteModel>(NoteModel.fromMap(data, id: id)),
    );
  }

  @override
  Stream<Either<Failure, List<NoteModel>>> listenToNotes() => firestoreService
      .getAllDocuments(collectionPath: AppsConstants.notesCollection)
      .map(
        (final Either<Failure, List<Map<String, dynamic>>> result) =>
            result.fold(
              Left.new,
              (final List<Map<String, dynamic>> list) =>
                  Right<Failure, List<NoteModel>>(
                    list.map((final Map<String, dynamic> mapWithId) {
                      final String id = mapWithId['id'] as String;
                      final Map<String, dynamic> data =
                          Map<String, dynamic>.from(mapWithId)..remove('id');
                      return NoteModel.fromMap(data, id: id);
                    }).toList(),
                  ),
            ),
      );
}
