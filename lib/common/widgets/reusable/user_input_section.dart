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
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: cGrey.withOpacity(0.2),
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [
          BoxShadow(
            color: cBlack.withOpacity(0.06),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            spreadRadius: 2,
          )
        ],
      ),
      alignment: Alignment.center,
      child: TextField(
        cursorHeight: 16,
        cursorColor: cGrey.withOpacity(0.2),
        style: text.textStyle(13.0, Weight.w6, cGrey, 0.0),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          contentPadding: const EdgeInsets.only(top: 15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.network(icn, height: 18, width: 18),
          ),
          hintText: txt,
          hintStyle: text.textStyle(13.0, Weight.w6, cGrey, 0.0),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
