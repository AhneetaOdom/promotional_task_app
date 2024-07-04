import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promotional_task3/utils/constants/colors.dart';


class TaskAppTextTheme {
  TaskAppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24.0,
      color: primaryColor,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
     bodySmall: GoogleFonts.poppins(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24.0,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  );
}