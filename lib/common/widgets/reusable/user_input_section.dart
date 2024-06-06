import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInputSection extends StatelessWidget {
  const UserInputSection(
      {super.key,
      required this.txt,
      required this.icn,
      required this.type,
      required this.height_,
      required this.width_,
      required this.controller});

  final String txt;
  final String icn;
  final TextInputType type;
  final double height_;
  final double width_;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * height_,
      width: screenSize.width * width_,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(40)),
      child: TextField(
        cursorHeight: 16,
        cursorColor: cGrey.withOpacity(0.2),
        style: text.textStyle(12.0, Weight.w6, cGrey, 0.0),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: StaticData.p5),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.network(icn, height: 18, width: 18),
          ),
          hintText: txt,
          hintStyle: text.textStyle(12.0, Weight.w6, cGrey, 0.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: cGrey.withOpacity(0.09)),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: cGrey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
