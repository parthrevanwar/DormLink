import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData().copyWith(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF4A9DFF),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF0B6ADB),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFDB0B0B),
        onError: Color(0xFFFFFFFF),
        background: Color(0xFFF1FAFF),
        onBackground: Color(0xFF2B2E35),
        surface: Color(0xFF4A9DFF),
        onSurface: Color(0xFF4A9DFF)),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF7F8F9),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA2B2D2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E1E1E),
        fixedSize: const Size(double.maxFinite, 60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF1E1E1E),
            fixedSize: const Size(double.maxFinite, 60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ))),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 24,
          //color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w500),
    ),
  );
}
