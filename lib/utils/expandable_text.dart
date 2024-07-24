// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/utils/animated_container_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final int minLines;

  const ExpandableText(
      {super.key,
      required this.maxLines,
      required this.minLines,
      required this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  int? _linesLength;

  // text widget
  final text = TextFond();

  Widget expandableText(bool isExpanded) {
    return Text(
      widget.text,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: csGrey,
        height: 1.5,
      ),
      maxLines: isExpanded ? widget.maxLines : widget.minLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        AnimatedExpandingContainer(
          isExpanded: _isExpanded,
          expandedWidget: expandableText(true),
          unexpandedWidget: expandableText(false),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: SizedBox(
            height: screeSize.height * 0.03,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  !_isExpanded ? "See More" : "See Less",
                  style: text.textStyle(12.0, Weight.w5, cBlack, 1.5),
                ),
                StaticData.gap1,
                Icon(
                  !_isExpanded ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 12,
                  color: cGreen,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
