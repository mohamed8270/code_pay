import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:flutter/material.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard({super.key, required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // text widget
    final text = TextFond();
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        height: screenSize.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1.5, color: cGrey.withOpacity(0.2)),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: text.textWidget(txt, 14.0, Weight.w6, cGrey.withOpacity(0.5)),
        ),
      ),
    );
  }
}
