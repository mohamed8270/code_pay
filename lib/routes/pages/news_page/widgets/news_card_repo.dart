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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        StaticData.gap2,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: scrnsize.width * 0.65,
              child: txt.textWidget(
                  h1, 14.0, FontWeight.w600, cBlack, TextOverflow.ellipsis),
            ),
            StaticData.gap1,
            txt.textWidget(p1, 12.0, FontWeight.w500, cBlack.withOpacity(0.5)),
          ],
        ),
      ],
    );
  }
}

class NewsCardError extends StatelessWidget {
  const NewsCardError({super.key, required this.p});

  final String p;

  @override
  Widget build(BuildContext context) {
    var scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    String img =
        'https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: scrnsize.height * 0.2,
            width: scrnsize.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.scaleDown,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          StaticData.gap2,
          txt.textWidget('Oops', 16.0, FontWeight.w600, cBlack),
          StaticData.gap1,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: txt.textWidget(p, 10.0, FontWeight.w500, cBlack,
                TextOverflow.visible, 1.5, TextAlign.center),
          ),
        ],
      ),
    );
  }
}
