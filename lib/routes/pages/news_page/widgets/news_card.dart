import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    String img = 'https://digital.wpi.edu/branding/cnews/logo/technewslogo.png';
    return Container(
      height: scrnsize.height * 0.22,
      width: scrnsize.width,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: scrnsize.height * 0.18,
              width: scrnsize.width * 0.3,
              decoration: BoxDecoration(
                color: ccGrey,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            StaticData.gap1,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txt.textWidget(
                  'Catch up the daily tech news and stay up-to-date with your skills',
                  14.0,
                  FontWeight.w600,
                  cBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
