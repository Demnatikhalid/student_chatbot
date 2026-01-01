import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: Colors.indigo,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
    accentColor: Colors.amber,
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
  ),
);