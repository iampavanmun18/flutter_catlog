import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkbluishColor = Color(0xfff403b58);
}
