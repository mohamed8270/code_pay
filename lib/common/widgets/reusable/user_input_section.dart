import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInputSection extends StatelessWidget {
  const UserInputSection(
      {super.key,
      required this.txt,
      required this.icn,
      required this.type,
      required this.height,
      required this.width,
      required this.controller});

  final String txt;
  final String icn;
  final TextInputType type;
  final double height;
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * height,
      width: screenSize.width * width,
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(40)),
      child: TextField(
        cursorHeight: 2,
        cursorColor: cGrey.withOpacity(0.2),
        style: text.textStyle(12, Weight.w6, cGrey),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.network(
            icn,
            height: 18,
            width: 18,
            colorFilter: const ColorFilter.mode(cGrey, BlendMode.srcIn),
          ),
          hintText: txt,
          hintStyle: text.textStyle(12, Weight.w6, cGrey),
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
