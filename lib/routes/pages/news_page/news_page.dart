import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/routes/pages/news_page/widgets/news_page_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weburl = dotenv.env['TECH_CRUNCH'].toString();
    var txt = TextFond();
    return Scaffold(
      backgroundColor: cWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: cWhite,
            border: Border(
              bottom: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
            ),
          ),
          alignment: Alignment.center,
          child: AppBar(
            backgroundColor: cWhite,
            scrolledUnderElevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txt.textWidget('Code Pay  ✨', 13.0, FontWeight.w600, cBlack),
                StaticData.gap1,
                SizedBox(
                  width: 110,
                  child: txt.textWidget(
                      weburl, 10.0, FontWeight.w400, cBlack, TextOverflow.clip),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(child: NewsPageWebview(weburl: weburl)),
    );
  }
}
