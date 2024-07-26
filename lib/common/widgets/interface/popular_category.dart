import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/utils/string_check.dart';
import 'package:flutter/material.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory(
      {super.key,
      required this.click,
      required this.posted,
      required this.applied,
      required this.views});

  final String posted;
  final String applied;
  final String views;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final scrnSize = MediaQuery.sizeOf(context);
    var text = TextFond();
    return Container(
      height: scrnSize.height * 0.073,
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
                StaticData.gap2,
                text.textWidget(
                  popularityPercent(
                      posted == 'a month ago' ? '30' : '0', applied, views),
                  12.0,
                  FontWeight.w400,
                  cWhite,
                ),
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
