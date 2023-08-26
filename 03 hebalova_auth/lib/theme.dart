import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(centerTitle: true),
  textTheme: GoogleFonts.openSansTextTheme(),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
);
