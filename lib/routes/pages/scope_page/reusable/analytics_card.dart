import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard(
      {super.key,
      required this.h,
      required this.w,
      required this.icn,
      required this.t1,
      required this.t2,
      required this.t3});

  final double h;
  final double w;
  final String icn;
  final String t1;
  final String t2;
  final String t3;

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var icon = ReusableClass();
    var text = TextFond();
    return Container(
      height: scrnsize.height * h,
      width: scrnsize.width * w,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon.svgIcon(icn, 18.0, 18.0, cGreen),
                StaticData.gap1,
                text.textWidget(t1, 11.0, FontWeight.w600, cBlack)
              ],
            ),
            StaticData.gap2,
            const Divider(height: 1.5, thickness: 1.5, color: csGrey),
            StaticData.gap1,
            text.textWidget(t2, 24.0, FontWeight.w800, cBlack),
            StaticData.gap1,
            text.textWidget(t3, 10.0, FontWeight.w500, cBlack),
          ],
        ),
      ),
    );
  }
}
