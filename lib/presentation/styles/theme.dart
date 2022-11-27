import 'package:esosa/presentation/styles/colors.dart';
import 'package:esosa/presentation/styles/text.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(primary)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 45, vertical: 12)),
      backgroundColor: MaterialStateProperty.all(primary),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(bodyMedium),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: primary),
    ),
  ),
);
