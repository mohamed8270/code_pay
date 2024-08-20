import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/routes/pages/news_page/widgets/news_page_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weburl = dotenv.env['TECH_CRUNCH'].toString();
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(child: NewsPageWebview(weburl: weburl)),
    );
  }
}
