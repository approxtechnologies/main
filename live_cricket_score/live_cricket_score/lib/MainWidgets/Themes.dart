import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: Vx.hexToColor("#2F90D1"),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  static Color grey = Vx.hexToColor("#F3F3F3");
  static Color textColor = Vx.hexToColor("#2D2D2D");
  static Color textHighlightColor = Vx.hexToColor("#BE3F07");
  static Color divaidarColor = Vx.hexToColor("#D9D9D9");
  static Color TEXT1COLOR = Vx.hexToColor("#5A5A5A");
}
