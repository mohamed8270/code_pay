import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:flutter/material.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key, required this.txt, required this.click});

  final String txt;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final scrnSize = MediaQuery.sizeOf(context);
    var text = TextFond();
    return Container(
      height: scrnSize.height * 0.07,
      width: scrnSize.width,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: scrnSize.height * 0.035,
                  width: scrnSize.width * 0.01,
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                StaticData.gap3,
                text.textWidget(txt, 12.0, FontWeight.w300, cWhite),
              ],
            ),
            CustomBtn(
              h: 0.035,
              w: 0.25,
              bg: cWhite,
              txt: 'Quick Apply',
              txts: 8.0,
              txtcolor: cBlack,
              r: 30,
              click: click,
            ),
          ],
        ),
      ),
    );
  }
}
