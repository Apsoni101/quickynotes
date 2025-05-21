import 'package:flutter/material.dart';

/// A reusable custom text field widget with optional validation.
class CustomTextField extends StatelessWidget {
  /// Creates a [CustomTextField] with label and hint text.
  const CustomTextField({
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    super.key,
    this.obscureText = false,
    this.keyboardType,
  });

  /// Controller for managing the input text.
  final TextEditingController textEditingController;

  /// Label text above the field.
  final String labelText;

  /// Hint text shown inside the field.
  final String hintText;

  /// Hides input text (for passwords).
  final bool obscureText;

  /// Input type (email, number, etc).
  final TextInputType? keyboardType;


  @override
  Widget build(final BuildContext context) => TextField(
    controller: textEditingController,
    obscureText: obscureText,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      border: const OutlineInputBorder(),
    ),
  );
}
