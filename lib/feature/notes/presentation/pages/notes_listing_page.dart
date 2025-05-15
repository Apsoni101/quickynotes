import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// simple splash screen
@RoutePage()
class NotesListingPage extends StatelessWidget {
    /// Creates an instance of splash.
  const NotesListingPage({super.key});

  @override
  Widget build(final BuildContext context) =>  const Scaffold(
      body: Center(child: Text("data"),),
    );
}
