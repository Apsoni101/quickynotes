import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// simple splash screen
@RoutePage()
class LoginPage extends StatelessWidget {
    /// Creates an instance of splash.
  const LoginPage({super.key});

  @override
  Widget build(final BuildContext context) =>  const Scaffold(
      body: Center(child: Text("loginRoute"),),
    );
}
