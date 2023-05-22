import 'package:flutter/material.dart';
import 'package:pokedex_challenge/application/common/style/greyscale.dart';

class PokedexStyle {
  static Color get primaryColor => const Color.fromRGBO(220, 10, 45, 1);
  static Greyscale greyscale = Greyscale(
    white: Colors.white,
    background: const Color.fromRGBO(239, 239, 239, 1),
    light: const Color.fromRGBO(224, 224, 224, 1),
    medium: const Color.fromRGBO(102, 102, 102, 1),
    dark: const Color.fromRGBO(29, 29, 29, 1),
  );

  static ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: primaryColor,
        ),
        cardTheme: CardTheme(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 8,
          ),
        ),
      );
}
