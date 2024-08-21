import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/news_page/widgets/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final weburl = dotenv.env['TECH_CRUNCH'].toString();
  var txt = TextFond();
  var icn = ReusableClass();

  var loading = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loading = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loading = progress;
            });
          },
          onPageFinished: (url) async {
            setState(() {
              loading = 100;
            });
          },
          onNavigationRequest: (request) {
            final host = Uri.parse(request.url).host;
            if (host.contains('youtube.com')) {
              Get.snackbar(
                'Unauthorized',
                'Cant navigate to page',
                colorText: cWhite,
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(weburl));
  }

  @override
  Widget build(BuildContext context) {
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
            actions: [NavigationControlls(controller: controller)],
          ),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loading < 100)
            LinearProgressIndicator(
              value: loading / 100,
              valueColor: const AlwaysStoppedAnimation<Color>(cGreen),
              color: Colors.transparent,
              minHeight: 3.5,
              borderRadius: BorderRadius.circular(5),
            ),
        ],
      ),
    );
  }
}
