import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/error/failure.dart';
import 'package:quicky_notes/feature/auth/domain/entities/user_entity.dart';
import 'package:quicky_notes/feature/auth/domain/use_cases/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authUseCase}) : super(AuthInitial()) {
    on<OnEmailLoginEvent>(_onEmailLoginEvent);
    on<OnGoogleLoginEvent>(_onGoogleLoginEvent);
  }
  AuthUseCase authUseCase;

  Future<void> _onEmailLoginEvent(
    final OnEmailLoginEvent event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final Either<Failure, UserEntity> result = await authUseCase
        .signInWithEmail(event.email, event.password);

    result.fold(
      (final Failure failure) => emit(AuthFailure(message: failure.message)),
      (final UserEntity user) => emit(AuthSuccessful()),
    );
  }

  Future<void> _onGoogleLoginEvent(
    final OnGoogleLoginEvent event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final Either<Failure, UserEntity> result =
        await authUseCase.signInWithGoogle();

    result.fold(
      (final Failure failure) => emit(AuthFailure(message: failure.message)),
      (final UserEntity user) => emit(AuthSuccessful()),
    );
  }
}
