import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/constants/app_text_styles.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/feature/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:quicky_notes/feature/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:quicky_notes/core/localisation/app_localizations.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.onRegistered});

  final VoidCallback? onRegistered;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  Widget build(final BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocProvider<RegisterBloc>(
      create: (final BuildContext context) => AppInjector.getIt<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (final BuildContext context, final RegisterState state) {
          if (state is RegisterSuccessful) {
            _emailController.clear();
            _passwordController.clear();
            widget.onRegistered?.call();
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    loc.registerToQuicky,
                    style: AppTextStyles.headline2.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _emailController,
                    labelText: loc.email,
                    hintText: loc.enterEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (final String? value) {
                      if (value == null || value.isEmpty) {
                        return loc.emailRequired;
                      }
                      if (!RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return loc.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    textEditingController: _passwordController,
                    labelText: loc.password,
                    hintText: loc.enterPassword,
                    obscureText: true,
                    validator: (final String? value) {
                      if (value == null || value.isEmpty) {
                        return loc.passwordRequired;
                      }
                      if (value.length < 6) {
                        return loc.passwordTooShort;
                      }
                      return null;
                    },
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (
                      final BuildContext context,
                      final RegisterState state,
                    ) {
                      if (state is RegisterLoading) {
                        return Lottie.asset(AppAssets.loading);
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<RegisterBloc>().add(
                              OnEmailRegisterEvent(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                        child: Text(loc.register, style: AppTextStyles.button),
                      );
                    },
                  ),
                  Builder(
                    //without builder throwing error of wrong context utilizing
                    builder:
                        (final BuildContext context) => GoogleSignInButton(
                          text: AppLocalizations.of(context).signupGoogle,
                          onPressed:
                              () => context.read<RegisterBloc>().add(
                                const OnGoogleRegisterEvent(),
                              ),
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        loc.alreadyHaveAccount,
                        style: AppTextStyles.body.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.router.pop(),
                        child: Text(
                          loc.login,
                          style: AppTextStyles.body.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
