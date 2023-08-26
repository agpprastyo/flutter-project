import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  TextStyle get altHeadingsH1 => GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: 0,
      );

  TextStyle get altHeadingsH2 => GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: 0,
      );

  TextStyle get mainBodyRegular => GoogleFonts.karla(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 0,
      );

  TextStyle get mainBodyBold => GoogleFonts.karla(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: 0,
      );

  TextStyle get mainCaptionRegular => GoogleFonts.karla(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 10,
      );
}
