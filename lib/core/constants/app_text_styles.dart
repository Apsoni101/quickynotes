import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headline1 - Large titles
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  // Headline2 - Section titles
  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  // Title
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // Subtitle
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Body
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Small body text
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Button
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle noteCardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // NoteCard content style (font only)
  static const TextStyle noteCardContent = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // NoteCard caption style (font only)
  static const TextStyle noteCardCaption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
