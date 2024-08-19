import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';

class NewsCardRepo extends StatelessWidget {
  const NewsCardRepo(
      {super.key, required this.url, required this.h1, required this.p1});

  final String url;
  final String h1;
  final String p1;

  @override
  Widget build(BuildContext context) {
    var scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    return Row(
      children: [
        Container(
          height: scrnsize.height * 0.2,
          width: scrnsize.width * 0.35,
          decoration: BoxDecoration(
            color: ccGrey,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        StaticData.gap1,
        Column(
          children: [
            txt.textWidget(h1, 14.0, FontWeight.w600, cBlack),
            StaticData.gap1,
            txt.textWidget(p1, 12.0, FontWeight.w500, cBlack.withOpacity(0.5)),
          ],
        ),
      ],
    );
  }
}
