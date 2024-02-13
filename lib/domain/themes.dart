

import 'package:auth/domain/color_scheme.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

final baseTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(),
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
    ),
  ),
  // snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
);

final lightTheme = baseTheme.copyWith(
  colorScheme: lightColorScheme,
);

final darkTheme = baseTheme.copyWith(
  colorScheme: darkColorScheme,
);
