import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFond {
  // Text widget
  Widget textWidget(data, size, weight, color, [flow, h, align]) {
    return Text(
      data,
      overflow: flow,
      textAlign: align,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: h,
      ),
    );
  }

  // text style widget
  TextStyle textStyle(size, weight, color, [h]) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: h,
    );
  }
}
