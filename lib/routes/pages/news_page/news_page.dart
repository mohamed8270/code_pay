import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/routes/pages/news_page/widgets/news_page_webview.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: cWhite,
      body: NewsPageWebview(weburl: 'https://techcrunch.com/'),
    );
  }
}
