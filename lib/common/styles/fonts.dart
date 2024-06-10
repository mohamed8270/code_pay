import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class FontSize {
//   static double h1 = 22;
//   static double h2 = 20;
//   static double h3 = 18;
//   static double h4 = 16;
//   static double h5 = 14;
//   static double h6 = 12;
//   static double h7 = 10;
//   static double h8 = 8;
// }

class Weight {
  static FontWeight w4 = FontWeight.w400;
  static FontWeight w5 = FontWeight.w500;
  static FontWeight w6 = FontWeight.w600;
  static FontWeight w7 = FontWeight.w700;
  static FontWeight w8 = FontWeight.w800;
  static FontWeight w9 = FontWeight.w900;
}

class TextFond {
  // Text widget
  Widget textWidget(data, size, weight, color, [flow, h, align]) {
    return Text(
      data,
      overflow: flow,
      textAlign: align,
      style: GoogleFonts.dmSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: h,
      ),
    );
  }

  // text style widget
  TextStyle textStyle(size, weight, color, h) {
    return GoogleFonts.dmSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: h,
    );
  }
}
