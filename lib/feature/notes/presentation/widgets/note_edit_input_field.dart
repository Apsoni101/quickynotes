import 'package:flutter/material.dart';

class NoteEditInputField extends StatelessWidget {
  const NoteEditInputField({
    required this.controller,
    required this.label,
    required this.isEditing,
    required this.textStyle,
    required this.labelStyle,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool isEditing;
  final TextStyle textStyle;
  final TextStyle labelStyle;
  final int maxLines;

  @override
  Widget build(final BuildContext context) => TextField(
    controller: controller,
    readOnly: !isEditing,
    maxLines: maxLines,
    style: textStyle,
    decoration: InputDecoration(
      border: isEditing ? const OutlineInputBorder() : InputBorder.none,
      labelText: label,
      labelStyle: labelStyle,
    ),
  );
}
