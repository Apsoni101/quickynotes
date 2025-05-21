import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/feature/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/login_page_loading.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key, this.onLoggedIn});

  final VoidCallback? onLoggedIn;

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
    listener: (final BuildContext context, final AuthState state) {
      if (state is AuthSuccessful) {
        _emailController.clear();
        _passwordController.clear();
        widget.onLoggedIn?.call();
      } else if (state is AuthFailure) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.message)));
      }
    },
    builder: (final BuildContext context, final AuthState state) {
      switch (state) {
        case AuthSuccessful():
        case AuthInitial():
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).loginToQuicky,
                    style: AppTextStyles.headline1.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  CustomTextField(
                    textEditingController: _emailController,
                    labelText: AppLocalizations.of(context).email,
                    hintText: AppLocalizations.of(context).enterEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (final String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).emailRequired;
                      }
                      if (!RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return AppLocalizations.of(context).invalidEmail;
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    textEditingController: _passwordController,
                    labelText: AppLocalizations.of(context).password,
                    hintText: AppLocalizations.of(context).enterPassword,
                    obscureText: true,
                    validator: (final String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).passwordRequired;
                      }
                      if (value.length < 6) {
                        return AppLocalizations.of(context).passwordTooShort;
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<AuthBloc>().add(
                          OnEmailLoginEvent(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).login,
                      style: AppTextStyles.button,
                    ),
                  ),
                  GoogleSignInButton(
                    text: AppLocalizations.of(context).googleSignIn,
                    onPressed:
                        () => context.read<AuthBloc>().add(
                          const OnGoogleLoginEvent(),
                        ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).dontHaveAccount,
                        style: AppTextStyles.body.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => context.router.push(
                              RegisterRoute(
                                onRegistered: () async {
                                  await context.router.replaceAll(
                                    <PageRouteInfo<Object?>>[
                                      const NotesListingRoute(),
                                    ],
                                  );
                                },
                              ),
                            ),
                        child: Text(
                          AppLocalizations.of(context).register,
                          style: AppTextStyles.body.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        case AuthLoading():
          return  const LoginPageLoading();
        case AuthFailure():
          return Center(child: Text(state.message));
      }
    },
  );
}
