import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/feature/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/login_page_body.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onLoggedIn});

  final VoidCallback? onLoggedIn;

  @override
  Widget build(final BuildContext context) => BlocProvider<AuthBloc>(
      create: (_) => AppInjector.getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (final BuildContext context, final AuthState state) {
          if (state is AuthSuccessful) {
            onLoggedIn?.call();
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: const Scaffold(
          body: LoginPageBody(),
        ),
      ),
    );
}
