import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInputSection extends StatelessWidget {
  const UserInputSection({
    super.key,
    required this.text,
    required this.icn,
    required this.type,
    required this.height_,
    required this.width_,
    required this.controller,
    required this.r,
  });

  final String text;
  final String icn;
  final TextInputType type;
  final double height_;
  final double width_;
  final double r;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // text widget
    var txt = TextFond();
    var svg = ReusableClass();
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * height_,
      width: screenSize.width * width_,
      decoration:
          BoxDecoration(color: csGrey, borderRadius: BorderRadius.circular(r)),
      child: TextField(
        cursorColor: cBlack,
        style: GoogleFonts.poppins(
            fontSize: 10, fontWeight: FontWeight.w500, color: cBlack),
        keyboardType: type,
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12),
          prefixIcon: Padding(
              padding: const EdgeInsets.all(13),
              child: svg.svgIcon(icn, 14.0, 14.0, cBlack)),
          hintText: text,
          hintStyle: txt.textStyle(10.0, FontWeight.w500, cBlack, 0.0),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
