import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/news_page/widgets/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String weburl;
  const WebViewPage({super.key, required this.weburl});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var icn = ReusableClass();
  var txt = TextFond();

  var loading = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
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
        onPageFinished: (url) {
          setState(() {
            loading = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.weburl));
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
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: icn.svgIcon(StaticData.quit, 11.0, 11.0, cBlack),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txt.textWidget('Code Pay  ✨', 13.0, FontWeight.w600, cBlack),
                StaticData.gap1,
                SizedBox(
                  width: 110,
                  child: txt.textWidget(widget.weburl, 10.0, FontWeight.w400,
                      cBlack, TextOverflow.clip),
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
            Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  value: loading / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(cGreen),
                  color: ccGrey,
                  strokeAlign: 3,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
