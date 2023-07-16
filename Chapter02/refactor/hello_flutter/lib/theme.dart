import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.acmeTextTheme(
      Theme.of(context).textTheme,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      color: Colors.orange,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
