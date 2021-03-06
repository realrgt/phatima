import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF130B1F),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF130B1F),
      secondary: Color(0xFF8C6D51),
      background: Color(0xFFE6EAF1),
      surface: Colors.white,
      secondaryVariant: Colors.grey,
    ),
    textTheme: TextTheme(
      headline6: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText1: GoogleFonts.poppins(fontSize: 18.0, color: Colors.grey),
      bodyText2: GoogleFonts.poppins(fontSize: 15.0, color: Colors.grey),
      subtitle2: GoogleFonts.poppins(
        fontSize: 13.0,
        color: const Color(0xFF8C6D51),
      ),
    ),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF130B1F),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF130B1F),
      secondary: Colors.red,
      background: Color(0xFFE6EAF1),
      surface: Colors.white,
    ),
    textTheme: TextTheme(
      headline6: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: Colors.grey[300],
      ),
      bodyText1: GoogleFonts.poppins(fontSize: 18.0, color: Colors.grey[300]),
      bodyText2: GoogleFonts.poppins(fontSize: 15.0, color: Colors.grey[300]),
    ),
  ),
};
