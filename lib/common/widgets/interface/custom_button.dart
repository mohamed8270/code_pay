import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.h,
      required this.w,
      required this.txt,
      required this.color,
      this.icn,
      required this.txtcolor,
      required this.icncolor,
      required this.click});

  final double h;
  final double w;
  final String txt;
  final Color color;
  final String? icn;
  final Color icncolor;
  final Color txtcolor;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // text widget
    final text = TextFond();
    // reusable
    final reusable = Get.put(ReusableClass());
    return GestureDetector(
      onTap: click,
      child: Container(
        height: screenSize.height * h,
        width: screenSize.width * w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text.textWidget(txt, 14.0, Weight.w6, txtcolor),
            StaticData.gap2,
            reusable.svgIcon(StaticData.send, 18.0, 18.0, icncolor)
          ],
        ),
      ),
    );
  }
}
