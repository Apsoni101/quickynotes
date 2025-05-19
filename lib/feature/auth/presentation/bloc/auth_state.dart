part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => <Object>[];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccessful extends AuthState {}

final class AuthFailure extends AuthState {
  const AuthFailure({required this.message});

  final String message;
}
