import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quicky_notes/core/services/error/failure.dart';
import 'package:quicky_notes/core/services/firebase_auth%20_service.dart';
import 'package:quicky_notes/feature/auth/data/models/user_model.dart';

/// abstract auth data source calling firebaseAuth service
abstract class AuthRemoteDataSource {
  ///used for signIn with email and password
  Future<Either<Failure, UserModel>> signUpWithEmail(
    final String email,
    final String password,
  );

  ///used for signIn with email and password
  Future<Either<Failure, UserModel>> signInWithEmail(
    final String email,
    final String password,
  );

  ///used for signingOut User
  Future<Either<Failure, Unit>> signOut();

  ///used for signIn with Google
  Future<Either<Failure, UserModel>> signInWithGoogle();

  ///used for checking signIn
  bool isSignedIn();

  ///used for getting current user
  User? getCurrentUser();
}

/// auth data source implementation for calling firebaseAuth service
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ///creates an instance of auth datasource impl
  AuthRemoteDataSourceImpl({required this.authService});

  ///calls auth service
  final FirebaseAuthService authService;

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
    final String email,
    final String password,
  ) async {
    final Either<Failure, User> result = await authService.signInWithEmail(
      email,
      password,
    );
    return result.map(UserModel.fromFirebaseUser);
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    final Either<Failure, User> result = await authService.signInWithGoogle();
    return result.map(UserModel.fromFirebaseUser);
  }

  @override
  Future<Either<Failure, Unit>> signOut() => authService.signOut();

  @override
  Future<Either<Failure, UserModel>> signUpWithEmail(
    final String email,
    final String password,
  ) async {
    final Either<Failure, User> result = await authService.signUpWithEmail(
      email,
      password,
    );
    return result.map(UserModel.fromFirebaseUser);
  }

  @override
  bool isSignedIn() => authService.auth.currentUser != null;

  @override
  User? getCurrentUser() => authService.auth.currentUser;
}
