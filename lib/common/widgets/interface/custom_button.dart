import 'package:code_pay/common/styles/fonts.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.h,
      required this.w,
      required this.bg,
      required this.txt,
      required this.txts,
      required this.txtcolor,
      required this.r,
      required this.click});

  final double h;
  final double w;
  final Color bg;
  final String txt;
  final double txts;
  final Color txtcolor;
  final double r;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    var text = TextFond();
    final scrnsize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: click,
      child: Container(
        height: scrnsize.height * h,
        width: scrnsize.width * w,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(r),
        ),
        alignment: Alignment.center,
        child: text.textWidget(txt, txts, FontWeight.w600, txtcolor),
      ),
    );
  }
}
