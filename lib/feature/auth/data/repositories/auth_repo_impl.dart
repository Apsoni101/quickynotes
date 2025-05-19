import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:quicky_notes/feature/auth/domain/entities/user_entity.dart';
import 'package:quicky_notes/feature/auth/domain/repositories/auth_repo.dart';

///  Repository impl that defines authentication-related operations.
class AuthRepoImpl implements AuthRepo {
  /// Creates an instance of authRepoImpl.
  AuthRepoImpl({required this.authRemoteDataSource});

  /// Remote data source for performing authentication operations.
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
    final String email,
    final String password,
  ) => authRemoteDataSource.signInWithEmail(email, password);

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() =>
      authRemoteDataSource.signInWithGoogle();

  @override
  Future<Either<Failure, Unit>> signOut() => authRemoteDataSource.signOut();

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
    final String email,
    final String password,
  ) => authRemoteDataSource.signUpWithEmail(email, password);

  @override
  bool isSignedIn() => authRemoteDataSource.isSignedIn();

  @override
  User? getCurrentUser() => authRemoteDataSource.getCurrentUser();
}
