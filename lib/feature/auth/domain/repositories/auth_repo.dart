import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/auth/domain/entities/user_entity.dart';

/// Abstract repository that defines authentication-related operations.
abstract class AuthRepo {
  /// Signs in the user using Google authentication.
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  /// Signs out the currently authenticated user.
  Future<Either<Failure, Unit>> signOut();

  /// Signs up a new user using email and password.
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    final String email,
    final String password,
  );

  /// Signs in an existing user using email and password.
  Future<Either<Failure, UserEntity>> signInWithEmail(
    final String email,
    final String password,
  );

  ///used for checking signIn
  bool isSignedIn();

  ///used for getting current user
  User? getCurrentUser();
}
