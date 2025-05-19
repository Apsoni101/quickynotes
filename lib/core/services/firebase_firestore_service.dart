import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/error/failure.dart';

/// Firestore service similar to network  service
class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Adds a document to a collection
  Future<Either<Failure, String>> addDocument({
    required final String collectionPath,
    required final Map<String, dynamic> data,
  }) async {
    try {
      final DocumentReference<Map<String, dynamic>> ref = await _firestore
          .collection(collectionPath)
          .add(data);
      return Right<Failure, String>(ref.id);
    } catch (e) {
      return Left<Failure, String>(Failure('Failed to add document: $e'));
    }
  }

  /// Updates a document by ID
  Future<Either<Failure, Unit>> updateDocument({
    required final String collectionPath,
    required final String docId,
    required final Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).update(data);
      return const Right<Failure, Unit>(unit);
    } catch (e) {
      return Left<Failure, Unit>(Failure('Failed to update document: $e'));
    }
  }

  /// Deletes a document
  Future<Either<Failure, Unit>> deleteDocument({
    required final String collectionPath,
    required final String docId,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).delete();
      return const Right<Failure, Unit>(unit);
    } catch (e) {
      return Left<Failure, Unit>(Failure('Failed to delete document: $e'));
    }
  }

  /// Gets a document once
  Future<Either<Failure, Map<String, dynamic>>> getDocument({
    required final String collectionPath,
    required final String docId,
  }) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore.collection(collectionPath).doc(docId).get();
      if (doc.exists && doc.data() != null) {
        return Right<Failure, Map<String, dynamic>>(doc.data()!);
      } else {
        return Left<Failure, Map<String, dynamic>>(
          Failure('Document not found'),
        );
      }
    } catch (e) {
      return Left<Failure, Map<String, dynamic>>(
        Failure('Failed to fetch document: $e'),
      );
    }
  }

  /// Listens to a document in real-time
  Stream<Either<Failure, Map<String, dynamic>>> listenToAllDocuments({
    required final String collectionPath,
    required final String docId,
  }) async* {
    try {
      await for (final DocumentSnapshot<Map<String, dynamic>> docSnapshot
          in _firestore.collection(collectionPath).doc(docId).snapshots()) {
        if (docSnapshot.exists) {
          final Map<String, dynamic>? data = docSnapshot.data();
          if (data != null) {
            yield Right<Failure, Map<String, dynamic>>(data);
          } else {
            yield Left<Failure, Map<String, dynamic>>(
              Failure("Document data is null"),
            );
          }
        } else {
          yield Left<Failure, Map<String, dynamic>>(
            Failure("Document does not exist"),
          );
        }
      }
    } on FirebaseException catch (e) {
      yield Left<Failure, Map<String, dynamic>>(
        Failure("Firestore error: ${e.message}"),
      );
    } catch (e) {
      yield Left<Failure, Map<String, dynamic>>(
        Failure("Unexpected error: $e"),
      );
    }
  }

  /// Listens to a collection in real-time
  Stream<Either<Failure, List<Map<String, dynamic>>>> getAllDocuments({
    required final String collectionPath,
  }) => _firestore
      .collection(collectionPath)
      .snapshots()
      .map((final QuerySnapshot<Map<String, dynamic>> snapshot) {
        final List<Map<String, dynamic>> docs =
            snapshot.docs.map((
              final QueryDocumentSnapshot<Map<String, dynamic>> doc,
            ) {
              final Map<String, dynamic> data = doc.data();
              data['id'] = doc.id;
              return data;
            }).toList();
        return Right<Failure, List<Map<String, dynamic>>>(docs);
      })
      .handleError(
        (final Object error) => Left<Failure, Map<String, dynamic>>(
          Failure('Stream error: $error'),
        ),
      );
}
