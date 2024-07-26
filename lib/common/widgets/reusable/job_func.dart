import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';

class JobDataFunc extends StatelessWidget {
  const JobDataFunc(
      {super.key, required this.icn, required this.txt1, required this.txt2});

  final String icn;
  final String txt1;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var svg = ReusableClass();
    var text = TextFond();
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        // height: scrnsize.height,
        width: scrnsize.width,
        decoration: BoxDecoration(
          color: cbGrey,
          border: Border.all(width: 1.3, color: csGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  svg.svgIcon(icn, 14.0, 14.0, cBlack),
                  StaticData.gap1,
                  text.textWidget(txt1, 12.0, FontWeight.w300, cBlack)
                ],
              ),
              StaticData.gap1,
              text.textWidget(txt2, 12.0, FontWeight.w600, cBlack),
            ],
          ),
        ),
      ),
    );
  }
}

class JobDataFuncList extends StatelessWidget {
  const JobDataFuncList(
      {super.key, required this.icn, required this.txt1, required this.skills});

  final String icn;
  final String txt1;
  final List skills;

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var svg = ReusableClass();
    var text = TextFond();
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        // height: scrnsize.height,
        width: scrnsize.width,
        decoration: BoxDecoration(
          color: cbGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                svg.svgIcon(icn, 14.0, 14.0, cBlack),
                StaticData.gap1,
                text.textWidget(txt1, 12.0, FontWeight.w300, cBlack)
              ],
            ),
            ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Container(
                  height: scrnsize.height * 0.05,
                  width: scrnsize.width,
                  decoration: BoxDecoration(
                    color: cbGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child:
                        text.textWidget(skills, 12.0, FontWeight.w600, cBlack),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
